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
    munin::plugin { ["users"],
    }
    include nlnogrepokey
    include ssh
    include timezone
#    include fail2ban-whitelist
    include nagios::target
    $postfix_smtp_listen = "127.0.0.1"
    $root_mail_recipient = "ring-admins@ring.nlnog.net"
    $postfix_myorigin = ""
    include postfix
}

node ringnode inherits basenode {
    include ring_users
    include ring_admins
    include no-apache2
    include syslog_ng::client
    include nodesonlycron
    package{ "munin": ensure => purged, }
}

node 'master01' inherits basenode {
    include ring_admins
    include munin::host
    include master_software
    include syslog_ng::server
    include apache2
    include mastercronjobs
    include nagios::defaults
    include nagios::headless
    nagios::service::ping { $name:
    }
    nagios::service::http { $name:
        check_domain => "${name}"
    }
    munin::plugin { ["apache_accesses", "apache_processes", "apache_volume"]:
    }

}

node 'master02' inherits basenode {
    include ring_admins
# this is not a puppetmaster for now
#    include master_software
#    include mastercronjobs
    include syslog_ng::server
    include apache2

    $sp_owner = "Job Snijders"
    $sp_owner_email = "job@snijders-it.nl"
    $sp_cgi_url = "http://master02.ring.nlnog.net/smokeping/smokeping.cgi"
    $sp_mailhost = "127.0.0.1"
    include smokeping::master

    nagios::service::ping { $name:
    }
    nagios::service::http { $name:
        check_domain => "${name}"
    }
    munin::plugin { ["apache_accesses", "apache_processes", "apache_volume"]:
    }

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

#### staging01 #####

node 'staging01' inherits ringnode {
    $owners = ['job']
    include smokeping::slave
    include fail2ban-whitelist
    nagios::service::ping { $name: }
}

#### einde staging01 #####

#### define all ring nodes ####

node 'intouch01' inherits ringnode {
    $owners = ['job']
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'bit01' inherits ringnode {
#    owner => "bit"
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'coloclue01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'widexs01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'xlshosting01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'interconnect01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'cambrium01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'cyso01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'zylon01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'duocast01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'easyhosting01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'previder01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'leaseweb01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'nxs01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'ic-hosting01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'xs4all01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'nedzone01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'oxilion01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'ebayclassifiedsgroup01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'is01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'surfnet01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'prolocation01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'in2ip01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'netground01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'totaalnet01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'signet01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'tripleit01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'jaguarnetwork01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'tuxis01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'tenet01' inherits ringnode {
    $nagios_ping_rate = '!300.0,20%!500.0,60%'
    include smokeping::slave
    nagios::service::ping { $name: 
    }
}

node 'bigwells01' inherits ringnode {
    $nagios_ping_rate = '!250.0,20%!500.0,60%'
    include smokeping::slave
    nagios::service::ping { $name: 
    }
}

node 'atrato01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'tdc01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'netability01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'unilogicnetworks01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'maverick01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'acsystemy01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'netsign01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'rrbone01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'hosteam01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'msp01' inherits ringnode {
    include smokeping::slave
    munin::plugin { ["sensors_volt", "sensors_temp", "sensors_fan"]:
        ensure => "sensors_" 
    }
    nagios::service::ping { $name: }
}

node 'inotel01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'fremaks01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'blix01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'portlane01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'solido01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'digmia01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'rootlu01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'globalaxs01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'nebula01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'tilaa01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'nautile01' inherits ringnode {
    $nagios_ping_rate = '!450.0,20%!700.0,60%'
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'voxel01' inherits ringnode {
    $nagios_ping_rate = '!250.0,20%!500.0,60%'
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'voxel02' inherits ringnode {
    $nagios_ping_rate = '!450.0,20%!700.0,60%'
    include smokeping::slave
    nagios::service::ping { $name: }
}

node 'neotelecoms01' inherits ringnode {
    include smokeping::slave
    nagios::service::ping { $name: }
}
