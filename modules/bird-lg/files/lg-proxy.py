# -*- coding: utf-8 -*-
# vim: ts=4
###
#
# Copyright (c) 2006 Mehdi Abaakouk
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 3 as
# published by the Free Software Foundation
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA
#
###


import subprocess
from urllib import unquote

from bird import BirdSocket

from flask import Flask, request, abort

app = Flask(__name__)
app.config.from_pyfile('lg-proxy.cfg')


def check_accesslist():
    if app.config["ACCESS_LIST"] and \
            request.remote_addr not in app.config["ACCESS_LIST"]:
        abort(401)


@app.route("/traceroute")
@app.route("/traceroute6")
def traceroute():
    check_accesslist()
    src = []
    if request.path == '/traceroute6':
        o = "-6"
    if app.config.get("IPV6_SOURCE", ""):
        src = ["-s",  app.config.get("IPV6_SOURCE")]
    else:
        o = "-4"
    if app.config.get("IPV4_SOURCE", ""):
        src = ["-s",  app.config.get("IPV4_SOURCE")]

    query = request.args.get("q", "")
    query = unquote(query)

    command = ['traceroute', o] + src \
        + ['-A', '-q1', '-N32', '-w1', '-m15', query]
    result = subprocess.Popen(command, stdout=subprocess.PIPE).communicate()[0].decode('utf-8', 'ignore').replace("\n", "<br>")
    return result


@app.route("/bird")
@app.route("/bird6")
def bird():
    check_accesslist()

    if request.path == "/bird":
        b = BirdSocket(file="/run/bird/bird.ctl")
    elif request.path == "/bird6":
        b = BirdSocket(file="/run/bird/bird6.ctl")
    else:
        return "No bird socket selected"

    query = request.args.get("q", "")
    query = unquote(query)

    status, result = b.cmd(query)
    b.close()
    # FIXME: use status
    return result


if __name__ == "__main__":
    app.debug = True
    app.run("0.0.0.0", port=5002)
