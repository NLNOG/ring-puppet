#!/usr/bin/env python

import time

from flask import Flask, request

app = Flask(__name__)

@app.route('/', methods=['POST'])
def root():
    print request.get_data()
    blob = open('/home/sqacollector/%s-%s'
        % (request.remote_addr, time.time()), 'w')
    blob.write(request.get_data())
    blob.close()
    return "OK"

if __name__ == '__main__':
    app.run(host="0.0.0.0", debug=True)
