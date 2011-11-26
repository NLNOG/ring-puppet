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
    include nlnogrepokey
    include ssh
    include timezone
    include nagios::target
    nagios::service::ping { $name: }
    $postfix_listen = "127.0.0.1"
    include postfix
}

node ringnode inherits basenode {
    include ring_users
    include ring_admins
    include no-apache2
    include syslog_ng::client
}
node ringmaster inherits basenode {
    include ring_admins
    include munin::host
    include master_software
    include syslog_ng::server
    include apache2
}

node 'master01' inherits ringmaster {
    $sp_owner = "Job Snijders"
    $sp_owner_email = "job@snijders-it.nl"
    $sp_cgi_url = "http://master01.ring.nlnog.net/smokeping/smokeping.cgi"
    $sp_mailhost = "127.0.0.1"
    include smokeping::master
    include nagios::defaults
    include nagios::headless
    nagios::service::http { $name:
        check_domain => "${name}"
    }
    $nagios_nsa_server = "irc.xs4all.nl"
    $nagios_nsa_nickname = "ringmaster"
    $nagios_nsa_channel = "#ring"
    $nagios_nsa_realname = "NLNOG RING notifications (http://ring.nlnog.net)"
    include nagios::irc_bot
}


# we don't want apache running on regular ringnodes. smokeping installs apache, so we just force it down here. 
class apache2 {
    service { "apache2":
        alias => "apache",
        enable => true,
        ensure => running,
    }
}

class no-apache2 {
    service { "apache2":
        enable => false,
        ensure => stopped,
    }
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

#### define all ring nodes ####

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
    $nagios_ping_rate = '!250.0,20%!500.0,60%'
}

node 'bigwells01' inherits ringnode {
    $nagios_ping_rate = '!150.0,20%!500.0,60%'
    include smokeping::slave
}

node 'atrato01' inherits ringnode {
    include smokeping::slave
}

node 'tdc01' inherits ringnode {
    include smokeping::slave
}

node 'netability01' inherits ringnode {
    include smokeping::slave
}

node 'unilogicnetworks01' inherits ringnode {
    include smokeping::slave
}

node 'maverick01' inherits ringnode {
    include smokeping::slave
}

node 'acsystemy01' inherits ringnode {
    include smokeping::slave
}

node 'netsign01' inherits ringnode {
    include smokeping::slave
}

node 'rrbone01' inherits ringnode {
    include smokeping::slave
}

node 'hosteam01' inherits ringnode {
    include smokeping::slave
}

node 'msp01' inherits ringnode {
    include smokeping::slave
}

node 'inotel01' inherits ringnode {
    include smokeping::slave
}

node 'fremaks01' inherits ringnode {
    include smokeping::slave
}




