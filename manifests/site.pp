# site.pp
$munin_cidr_allow = '212.19.220.59/32' 

import "modules.pp"
import "nodes"
import "classes/*.pp"
import "ring-users"
import "ring-admins"
import "software"
import "cron"
import "etcfiles"

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

