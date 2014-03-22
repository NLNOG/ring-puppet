#!/usr/bin/python3
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#
# Original author: Stefan Plug, Sean Rijs
#
#import ConfigParser
import sys
import getopt
import socket
import subprocess
import json
import logging
import time
from multiprocessing import Pool
import os

def usage():
    print("Usage: decard-client -s 127.0.0.1 -p 1337\n\n"
        "\t-s[erver] 127.0.0.1     *IP address\n"
        "\t-p[ort] 1337            *Port number\n"
        "\t-v                      *Verbose mode\n"
    )
    sys.exit(2)

def parse_type(dct):
    if 'UPDATE' in dct:
        return('UPDATE')
    elif 'ERROR' in dct:
        return('ERROR')
    else:
        return("UNKOWN")

def parse_slaves(dct):
    if 'SLAVES' in dct:
        return(dct['SLAVES'])

def parse_ttl(dct):
    if 'TTL' in dct:
        return(dct['TTL'])

def sendmsg(sock, msg):
    timeout = 5.0
    sock.settimeout(timeout)
    try:
        sock.connect((ip, port))
    except socket.error as err:
        logging.error(err)
        return 2 
    finally:
        sock.sendall(msg.encode())
        sock.close()

def sendrecvmsg(sock, msg):
    timeout = 5.0
    sock.settimeout(timeout)
    try:
        sock.connect((ip, port))
    except socket.error as err:
        logging.error(err)
        quit(2)
    sock.sendall(msg.encode())
    try:
        msg = sock.recv(1024).decode()
        return msg
    except socket.timeout:
        logging.error("Connection to server timed out")
        return 2
    finally:
        sock.close()

def client(given_ip, given_port):
    global ip
    global port
    ip = given_ip
    port = given_port
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    message = {'HELLO': 'true'}
    message = json.dumps(message)
    msg = sendrecvmsg(sock, message)
    sock.close()

    #parse message type
    msg_type = json.loads(msg, object_hook=parse_type)
    logging.debug("Message type: %s", msg_type)

    if msg_type == 'UPDATE':
        # decode the slaves list to a list
        logging.debug(msg)
        msg_slaves = json.loads(msg, object_hook=parse_slaves)
        logging.debug("Slaves: %s", msg_slaves)
        # decode the JSON TTL
        msg_ttl = json.loads(msg, object_hook=parse_ttl)
        logging.debug("TTL: %s", msg_ttl)

        #remove ourself from the slave list
        msg_slaves.pop(0)
        #start availability checking in parallel
        logging.debug("Starting %i processes", len(msg_slaves))
        pool = Pool(processes=len(msg_slaves))
        for slave in msg_slaves:
            pool.apply_async(CheckNode, (ip, port, slave, msg_ttl,))
        pool.close()
        pool.join()
        logging.debug('Client function done')
    else:
        logging.debug("unkown message")

class CheckNode():
    """
    Check a slave nodes availability
    """
    def __init__(self, server_ip, server_port, slave, ttl):
        logging.debug('parent process: %i', os.getppid())
        logging.debug('process id: %i', os.getpid())
        #the default mark is offline
        self.alive = 1
        self.ip = server_ip
        self.port = server_port
        self.ttl = ttl
        self.limit = self.ttl + time.time()
        #check the node until TTL
        while self.limit > time.time():
            self.check_node(slave)
            #WARNING: The below time should be depending on what scripts
            #         scripts you plan to run for availability checking.
            time.sleep(10)
        #CheckNode doesn't need to return anything
        logging.debug('%i: DONE', os.getpid())
        return None
    def check_node(self, slave):
        """
        This function determines if a node is up or not. In here
        you should define the "availability" tests.
        """
        ping = subprocess.check_call("/etc/deckardnode/scripts/ping.sh %s" % slave, shell=True)
        if (ping == 0) and (self.alive != 0):
            logging.warning("notifing deckard-server slave is self.alive again")
            notify_available(slave)
            self.alive = 0
        elif (ping == 1) and (self.alive != 1):
            logging.warning("notifing deckard-server slave is down again")
            notify_unvailable(slave)
            self.alive = 1
        elif ping == self.alive:
            logging.info("no slave status news, not sending anything")
        else:
            logging.info("we matched nothing")
            
def notify_available(slave):
    """
    Notify the Deckard-server that a node is available from our
    perspective.
    """
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    message = {'UPDATE': 'true', 'SLAVE': slave, 'STATUS': 1}
    message = json.dumps(message)
    sendmsg(sock, message)

def notify_unvailable(slave):
    """
    Notify the Deckard-server that a node is unavailable from our
    perspective.
    """
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    message = {'UPDATE': 'true', 'SLAVE': slave, 'STATUS': 0}
    message = json.dumps(message)
    sendmsg(sock, message)
