# site.pp
$munin_cidr_allow = ['2001:7b8:d05:1::167/128', '165.254.255.13/32']

$logServerList = ['master01.infra.ring.nlnog.net']

import "modules.pp"
import "nodes"
import "classes/*.pp"
import "ring-users"
import "ring-admins"
import "software"
import "cron"
import "various_files"

filebucket { main: server => puppet }

# global defaults
File { backup => main }
Exec { path => "/usr/bin:/usr/sbin/:/bin:/sbin" }

$cacert = "/var/lib/puppet/ssl/certs/ca.pem"
$signedcert = "/var/lib/puppet/ssl/certs/${fqdn}.pem"
$certkey = "/var/lib/puppet/ssl/private_keys/${fqdn}.pem"

Package {
    provider => $operatingsystem ? {
        debian => apt,
        ubuntu => apt
    }
}

