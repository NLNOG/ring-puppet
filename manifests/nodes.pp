# nodes.pp
#
## Hosts

node basenode {
    include cronjobs
    include groups
    include nettools
    include etcfiles
    include local_binaries
    include munin::client
    $syslog_server = "212.19.220.59"
    include syslog-ng
    include nlnogrepokey
    include ssh
    include timezone
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
    service { "postfix":
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

node 'cyso01' inherits ringnode {
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

node 'nxs01' inherits ringnode {
    include smokeping::slave
}

node 'ic-hosting01' inherits ringnode {
    include smokeping::slave
}

node 'xs4all01' inherits ringnode {
    include smokeping::slave
}

node 'nedzone01' inherits ringnode {
    include smokeping::slave
}

node 'oxilion01' inherits ringnode {
    include smokeping::slave
}

node 'ebayclassifiedsgroup01' inherits ringnode {
    include smokeping::slave
}

node 'evertjenetworks01' inherits ringnode {
    include smokeping::slave
}

node 'is01' inherits ringnode {
    include smokeping::slave
}

node 'surfnet01' inherits ringnode {
    include smokeping::slave
}

node 'prolocation01' inherits ringnode {
    include smokeping::slave
}

node 'in2ip01' inherits ringnode {
    include smokeping::slave
}

node 'netground01' inherits ringnode {
    include smokeping::slave
}

node 'totaalnet01' inherits ringnode {
    include smokeping::slave
}

node 'signet01' inherits ringnode {
    include smokeping::slave
}

node 'tripleit01' inherits ringnode {
    include smokeping::slave
}

node 'jaguarnetwork01' inherits ringnode {
    include smokeping::slave
}

node 'tuxis01' inherits ringnode {
    include smokeping::slave
}

node 'tenet01' inherits ringnode {
    include smokeping::slave
}

node 'bigwells01' inherits ringnode {
    include smokeping::slave
}

node 'atrato01' inherits ringnode {
    include smokeping::slave
}

node 'tdc01' inherits ringnode {
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



