#!/usr/bin/env bash

/usr/bin/sc_attach -p 23456 -c 'trace' -i /etc/ring/node-list.txt -o /home/scamper/collected/$(hostname)-$(date +%s).warts
gzip -9 /home/scamper/collected/*.warts
chmod +r /home/scamper/collected/*

