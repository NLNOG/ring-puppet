#!/usr/bin/env python
# Written by Job Snijders <job@snijders-it.nl>

import sys
import dns.resolver

ringdomain = "ring.nlnog.net"
hosts = []
all_hosts = []

for answers in dns.resolver.query(ringdomain, 'TXT',):
    hosts.append(answers.to_text()[1:-1].split(' '))
all_hosts = sum(hosts, [])

# print standard header that every hosts needs regardless

print """127.0.0.1   localhost

# The following lines are desirable for IPv6 capable hosts
::1     localhost ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters

212.19.220.59   master01 master01.ring.nlnog.net puppet
2001:6e0:100:4001::3    master01 master01.ring.nlnog.net puppet

213.154.236.191 staging01   staging01.ring.nlnog.net
2001:7b8:625:0:213:154:236:191  staging01 staging01.ring.nlnog.net
"""

for server in all_hosts:
    server_fqdn = server + "." + ringdomain
    for record in 'A', 'AAAA':
        server_record = dns.resolver.query(server_fqdn, record)
        server_record = str(server_record[0])
        print server_record + "\t" + server + "\t" + server_fqdn
    print
