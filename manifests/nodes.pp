# nodes.pp
#
## Hosts

node basenode {
    include cronjobs
    include groups
    include nettools
    include etcfiles
    include munin::client
    $syslog_server = "212.19.220.59"
    include syslog-ng
}

node ringnode inherits basenode {
    include ring_users
    include ring_admins
    include apache2
}
node ringmaster inherits basenode {
    include ring_admins
    include munin::host
    include master_software
    include syslog-ng::server
}

# we don't want apache running on regular ringnodes. smokeping installs apache, so we just force it down here. 
class apache2 {
    service { "apache2":
        enable => false,
        ensure => stopped,
    }
}

node 'intouch01' inherits ringnode {
    $owners = ['job']
    include smokeping::slave
}

node 'bit01' inherits ringnode {
#    owner => "bit"
    include smokeping::slave
}

node 'coloclue01' inherits ringnode {
    include smokeping::slave
}

node 'widexs01' inherits ringnode {
    include smokeping::slave
}

node 'xlshosting01' inherits ringnode {
    include smokeping::slave
}

node 'interconnect01' inherits ringnode {
    include smokeping::slave
}

node 'cambrium01' inherits ringnode {
    include smokeping::slave
}

node 'zylon01' inherits ringnode {
    include smokeping::slave
}

node 'duocast01' inherits ringnode {
    include smokeping::slave
}

node 'easyhosting01' inherits ringnode {
    include smokeping::slave
}

node 'previder01' inherits ringnode {
    include smokeping::slave
}

node 'leaseweb01' inherits ringnode {
    include smokeping::slave
}

node 'master01' inherits ringmaster {
    $sp_owner = "Job Snijders"
    $sp_owner_email = "job@snijders-it.nl"
    $sp_cgi_url = "http://master01.ring.nlnog.net/smokeping/smokeping.cgi"
    $sp_mailhost = "smtp.ring.nlnog.net"
    include smokeping::master
}


## define all groups

class groups {
    add_group { ring-users:
        gid => 5000
    }
    add_group { ring-admins:
        gid => 6000
    }
}



