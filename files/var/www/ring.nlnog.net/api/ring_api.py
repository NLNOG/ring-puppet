#!/usr/bin/env python
import json
import sys, re, string, os, tempfile, random
import MySQLdb as mdb
from flask import Flask, jsonify
from string import Template

DBHOST='dbmaster.infra.ring.nlnog.net'
DBUSER='ring'
DBPASS=''
DB='ring'

def dbquery(q, v=None):
    conn = mdb.connect(DBHOST,DBUSER,DBPASS,DB)
    if not conn:
        sys.stderr.write("could not connect to db\n")
        sys.exit(1)
    cur = conn.cursor(mdb.cursors.DictCursor)
    if v:
        cur.execute(q, v)
    else:
        cur.execute(q)
    for row in cur.fetchall():
        yield row
    conn.close()

def dbget_participants():
    pl = []
    query = "select * from participants where public!=0 or public is null"
    res = list(dbquery(query))
    for p in res:
        pl.append({'id':p['id'], 
                   'company':p['company'],
                   'description':p['companydesc'],
                   'url':p['url']
                 })
    random.shuffle(pl)
    return pl

def dbget_nodes():
    nl = []
    query = "select * from machines"
    res = list(dbquery(query))
    for n in res:
        nl.append({'id':n['id'], 
                   'hostname':n['hostname'],
                   'ipv4':n['v4'],
                   'ipv6':n['v6'],
                   'asn':n['autnum'],
                   'countrycode':n['country'],
                   'statecode':n['state'],
                   'datacenter':n['dc'],
                   'geo':n['geo'],
                   'active':n['active'],
                   'participant':n['owner']
                 })
    random.shuffle(nl)
    return nl

# Application routing
app = Flask(__name__)

@app.route('/')
def index():
    return "Hello, World!"

@app.route('/1.0', methods = ['GET'])
def get_api_1_0():
    api = {
        'participants':'List of participants',
        'participants/[id]':'Participant by id',
        'nodes':'List of nodes',
        'nodes/[id]':'Node by id',
        'nodes/country/[countrycode]':'Nodes by country',
        'nodes/country/[countrycode]/state/[statecode]':'Nodes by country/state',
        'nodes/active':'Active nodes',
        'nodes/active/country/[countrycode]':'Active nodes by country',
        'nodes/active/country/[countrycode]/state/[statecode]':'Active nodes by country/state',
        'participants/[id]/nodes':'Nodes by participant id',
    }
    return jsonify(api)

@app.route('/1.0/participants', methods = ['GET'])
def get_participants():
    participantlist = dbget_participants()
    random.shuffle(participantlist)
    return jsonify({'participants':participantlist})

@app.route('/1.0/participants/<int:participant_id>', methods = ['GET'])
def get_participant(participant_id):
    participantlist = dbget_participants()
    participantlist = filter(lambda p: p['id'] == participant_id, participantlist)
    return jsonify({'participants':participantlist})

@app.route('/1.0/participants/<int:participant_id>/nodes', methods = ['GET'])
def get_nodes_participant(participant_id):
    nodelist = dbget_nodes()
    nodelist = filter(lambda n: n['participant'] == participant_id, nodelist)
    return jsonify({'nodes':nodelist})

@app.route('/1.0/nodes', methods = ['GET'])
def get_nodes():
    nodelist = dbget_nodes()
    random.shuffle(nodelist)
    return jsonify({'nodes':nodelist})

@app.route('/1.0/nodes/<int:node_id>', methods = ['GET'])
def get_node(node_id):
    nodelist = dbget_nodes()
    nodelist = filter(lambda n: n['id'] == node_id, nodelist)
    return jsonify({'nodes':nodelist})

@app.route('/1.0/nodes/country/<string:country>', methods = ['GET'])
def get_nodes_country(country):
    nodelist = dbget_nodes()
    nodelist = filter(lambda n: n['countrycode'] == country.upper(), nodelist)
    random.shuffle(nodelist)
    return jsonify({'nodes':nodelist})

@app.route('/1.0/nodes/country/<string:country>/state/<string:state>', methods = ['GET'])
def get_nodes_country_state(country,state):
    nodelist = dbget_nodes()
    nodelist = filter(lambda n: n['countrycode'] == country.upper(), nodelist)
    nodelist = filter(lambda n: n['statecode'] == state.upper(), nodelist)
    random.shuffle(nodelist)
    return jsonify({'nodes':nodelist})

@app.route('/1.0/nodes/active', methods = ['GET'])
def get_nodes_active():
    nodelist = dbget_nodes()
    nodelist = filter(lambda n: n['active'] == 1, nodelist)
    random.shuffle(nodelist)
    return jsonify({'nodes':nodelist})

@app.route('/1.0/nodes/active/country/<string:country>', methods = ['GET'])
def get_nodes_active_country(country):
    nodelist = dbget_nodes()
    nodelist = filter(lambda n: n['active'] == 1, nodelist)
    nodelist = filter(lambda n: n['countrycode'] == country.upper(), nodelist)
    random.shuffle(nodelist)
    return jsonify({'nodes':nodelist})

@app.route('/1.0/nodes/active/country/<string:country>/state/<string:state>', methods = ['GET'])
def get_nodes_active_country_state(country,state):
    nodelist = dbget_nodes()
    nodelist = filter(lambda n: n['active'] == 1, nodelist)
    nodelist = filter(lambda n: n['countrycode'] == country.upper(), nodelist)
    nodelist = filter(lambda n: n['statecode'] == state.upper(), nodelist)
    random.shuffle(nodelist)
    return jsonify({'nodes':nodelist})

if __name__ == '__main__':
    app.run(debug=True)

