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
    munin::plugin { ["users", "tcp"]:
    }
    include nlnogrepokey
    include ssh
    include timezone
    include fail2ban-whitelist
    include nagios::target
    $postfix_smtp_listen = "127.0.0.1"
    $root_mail_recipient = "ring-admins@ring.nlnog.net"
    $postfix_myorigin = ""
    include postfix
}

node ringnode inherits basenode {
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
    include nagios_services
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
    $sp_cgi_url = "http://master02.ring.nlnog.net/smokeping/smokeping.fcgi"
    $sp_mailhost = "127.0.0.1"
    include smokeping::master

    include nagios_services
    
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

# add things that should be checked here
class nagios_services {
    nagios::service::ping { $name: }
    nagios::service::ssh { $name: }
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

class realise_ringusers {
#    User <| group == ring-users |>
    realize(test::add_user["intouch"],)
}
#### staging01 #####

node 'staging01' inherits ringnode {
    $owners = ['job']
    include smokeping::slave
    include nagios_services
    include ring_users
    include realise_ringusers
}

#### einde staging01 #####

#### define all ring nodes ####

node 'intouch01' inherits ringnode {
    $owners = ['job']
    include smokeping::slave
    include nagios_services
}

node 'bit01' inherits ringnode {
#    owner => "bit"
    include smokeping::slave
    include nagios_services
}

node 'coloclue01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'widexs01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'xlshosting01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'interconnect01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'cambrium01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'cyso01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'zylon01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'duocast01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'easyhosting01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'previder01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'leaseweb01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'nxs01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'ic-hosting01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'xs4all01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'nedzone01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'oxilion01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'ebayclassifiedsgroup01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'is01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'surfnet01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'prolocation01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'in2ip01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'netground01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'totaalnet01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'signet01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'tripleit01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'jaguarnetwork01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'tuxis01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'tenet01' inherits ringnode {
    $nagios_ping_rate = '!300.0,20%!500.0,60%'
    include smokeping::slave
    include nagios_services
}

node 'bigwells01' inherits ringnode {
    $nagios_ping_rate = '!250.0,20%!500.0,60%'
    include smokeping::slave
    include nagios_services
}

node 'atrato01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'tdc01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'netability01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'unilogicnetworks01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'maverick01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'acsystemy01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'netsign01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'rrbone01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'hosteam01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'msp01' inherits ringnode {
    include smokeping::slave
    munin::plugin { ["sensors_volt", "sensors_temp", "sensors_fan"]:
        ensure => "sensors_" 
    }
    include nagios_services
}

node 'inotel01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'fremaks01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'blix01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'portlane01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'solido01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'digmia01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'rootlu01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'globalaxs01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'nebula01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'tilaa01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}

node 'nautile01' inherits ringnode {
    $nagios_ping_rate = '!450.0,20%!700.0,60%'
    include smokeping::slave
    include nagios_services
}

node 'voxel01' inherits ringnode {
    $nagios_ping_rate = '!250.0,20%!500.0,60%'
    include smokeping::slave
    include nagios_services
}

node 'voxel02' inherits ringnode {
    $nagios_ping_rate = '!450.0,20%!700.0,60%'
    include smokeping::slave
    include nagios_services
}

node 'neotelecoms01' inherits ringnode {
    include smokeping::slave
    include nagios_services
}
