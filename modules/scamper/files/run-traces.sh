#!/usr/bin/env bash

filename="$(hostname)-$(date +%s).warts"

/usr/bin/sc_attach -p 23456 -c 'trace' -i /etc/ring/node-list.txt -o /tmp/$$.${filename} && \
    mv /tmp/$$.${filename} /home/scamper/collected/${filename} && \
    gzip /home/scamper/collected/${filename}

chown scamper.ring-users /home/scamper/collected/${filename}.gz
