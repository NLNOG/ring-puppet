#!/usr/bin/env python

import datetime, json, socket
from flask import Flask, request
from sqlalchemy import create_engine, and_, desc
from sqlalchemy.orm import sessionmaker
from sqa_collector_db import DECLARATIVE_BASE, SqaCollector

app = Flask(__name__)

enginestr = 'mysql://sqa_collector:sqa_collector@localhost/sqa_collector'
engine = create_engine(enginestr)
DECLARATIVE_BASE.metadata.bind = engine
DBSession = sessionmaker(bind=engine)
session = DBSession()

@app.route('/', methods=['GET'])
def display():
    html = '<html><head><title>Blobs</title></head>' 
    html += '<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"><style>td { padding: 15px; }</style>'
    html += '<body><table border=1><tr><th>id</th><th>started</th><th>ended</th><th>raised_by</th><th>short</th></tr>'
    for alarm in session.query(SqaCollector).order_by(desc(SqaCollector.started)).limit(50):
        html += "<tr><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>" % (alarm.id, alarm.started, alarm.ended, alarm.raised_by, alarm.short)
    html += '</table></body></html>'
    return html

@app.route('/', methods=['POST'])
def store():
    try:
        blob    = json.loads(request.get_data())
        afi     = blob['afi']
        short   = blob['short']
        try:
            raised_by = socket.gethostbyaddr(request.remote_addr)[0]
            if '.' in raised_by:
                print "Unrecognised sending host %s" % raised_by
                return "FAIL 1"
        except Exception, e:
            print e
            return "FAIL 2"

        if blob['status'] == 'raise':
            session.add(SqaCollector(started=datetime.datetime.today(), raised_by=raised_by, afi=afi, short=short))
            session.commit()
        elif blob['status'] == 'clear':
            open_alarms = session.query(SqaCollector).filter(and_(SqaCollector.afi==afi, SqaCollector.ended==None))
            if open_alarms:
                for open_alarm in open_alarms:
                    open_alarm.ended=datetime.datetime.today()
            session.commit()
    except Exception, e:
        print e
        return "FAIL 3"
    else:
        return "OK"

if __name__ == '__main__':
    app.run(host="0.0.0.0", debug=True)
