# site.pp
$munin_cidr_allow = ['82.94.230.131/32', '2001:888:2001::131/128']

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

Package {
    provider => $operatingsystem ? {
        debian => apt,
        ubuntu => apt
    }
}

