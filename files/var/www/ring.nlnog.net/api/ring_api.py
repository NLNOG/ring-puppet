#!/usr/bin/env python
import MySQLdb as mdb
import sys, re, string, os, tempfile
from string import Template
import json

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

ml = []
query = "select * from machines"
res = list(dbquery(query))
for m in res:
    hostname=m['hostname']
    autnum=str(m['autnum'])
    v4=m['v4']
    v6=m['v6']
    geo=m['geo']

    #print "%s %s %s %s %s" % (hostname,autnum,v4,v6,geo)
    ml.append({'hostname':hostname,'autnum':autnum,'v4':v4,'v6':v6,'geo':geo })

#print json.dumps(ml,indent=2)
import random
from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
def index():
    return "Hello, World!"

@app.route('/v1.0/machines', methods = ['GET'])
def get_machines():
    random.shuffle(ml)
    return jsonify({'machinelist':ml})

if __name__ == '__main__':
    app.run()

