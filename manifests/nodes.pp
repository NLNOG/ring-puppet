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
    add_group { admin:
        gid => 99
    }
    add_group { ring-admins:
        gid => 6000 
    }
}

#### staging01 #####

node 'staging01' inherits ringnode {
    $owner = "job"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

#### einde staging01 #####

#### define all ring nodes ####

node 'intouch01' inherits ringnode {
    $owner = "intouch"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'bit01' inherits ringnode {
    $owner = "bit"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'coloclue01' inherits ringnode {
    $owner = "coloclue"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'widexs01' inherits ringnode {
    $owner = "widexs"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'xlshosting01' inherits ringnode {
    $owner = "xlshosting"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'interconnect01' inherits ringnode {
    $owner = "interconnect"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'cambrium01' inherits ringnode {
    $owner = "cambrium"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'cyso01' inherits ringnode {
    $owner = "cyso"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'zylon01' inherits ringnode {
    $owner = "zylon"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'duocast01' inherits ringnode {
    $owner = "duocast"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'easyhosting01' inherits ringnode {
    $owner = "easyhosting"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'previder01' inherits ringnode {
    $owner = "previder"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'leaseweb01' inherits ringnode {
    $owner = "leaseweb"
    include smokeping::slave
    include nagios_servicesn
    include set_local_settings
}

node 'nxs01' inherits ringnode {
    $owner = "nxs"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'ic-hosting01' inherits ringnode {
    $owner = "ic-hosting"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'xs4all01' inherits ringnode {
    $owner = "xs4all"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'nedzone01' inherits ringnode {
    $owner = "nedzone"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'oxilion01' inherits ringnode {
    $owner = "oxilion"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'ebayclassifiedsgroup01' inherits ringnode {
    $owner = "ebayclassifiedsgroup"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'is01' inherits ringnode {
    $owner = "is"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'surfnet01' inherits ringnode {
    $owner = "surfnet"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'prolocation01' inherits ringnode {
    $owner = "prolocation"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'in2ip01' inherits ringnode {
    $owner = "in2ip"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'netground01' inherits ringnode {
    $owner = "netground"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'totaalnet01' inherits ringnode {
    $owner = "totaalnet"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'signet01' inherits ringnode {
    $owner = "signet"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'tripleit01' inherits ringnode {
    $owner = "tripleit"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'jaguarnetwork01' inherits ringnode {
    $owner = "jaguarnetwork"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'tuxis01' inherits ringnode {
    $owner = "tuxis"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'tenet01' inherits ringnode {
    $owner = "tenet"
    $nagios_ping_rate = '!300.0,20%!500.0,60%'
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'bigwells01' inherits ringnode {
    $owner = "bigwells"
    $nagios_ping_rate = '!250.0,20%!500.0,60%'
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'atrato01' inherits ringnode {
    $owner = "atrato"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'tdc01' inherits ringnode {
    $owner = "tdc"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'netability01' inherits ringnode {
    $owner = "netability"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'unilogicnetworks01' inherits ringnode {
    $owner = "unilogicnetworks"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'maverick01' inherits ringnode {
    $owner = "maverick"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'acsystemy01' inherits ringnode {
    $owner = "acsystemy"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'netsign01' inherits ringnode {
    $owner = "netsign"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'rrbone01' inherits ringnode {
    $owner = "rrbone"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'hosteam01' inherits ringnode {
    $owner = "hosteam"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'msp01' inherits ringnode {
    $owner = "msp"
    include smokeping::slave
    munin::plugin { ["sensors_volt", "sensors_temp", "sensors_fan"]:
        ensure => "sensors_" 
    }
    include nagios_services
    include set_local_settings
}

node 'inotel01' inherits ringnode {
    $owner = "inotel"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'fremaks01' inherits ringnode {
    $owner = "fremaks"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'blix01' inherits ringnode {
    $owner = "blix"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'portlane01' inherits ringnode {
    $owner = "portlane"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'solido01' inherits ringnode {
    $owner = "solido"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'digmia01' inherits ringnode {
    $owner = "digmia"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'rootlu01' inherits ringnode {
    $owner = "rootlu"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'globalaxs01' inherits ringnode {
    $owner = "globalaxs"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'nebula01' inherits ringnode {
    $owner = "nebula"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'tilaa01' inherits ringnode {
    $owner = "tilaa"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'nautile01' inherits ringnode {
    $owner = "nautile"
    $nagios_ping_rate = '!450.0,20%!700.0,60%'
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'voxel01' inherits ringnode {
    $owner = "voxel"
    $nagios_ping_rate = '!250.0,20%!500.0,60%'
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'voxel02' inherits ringnode {
    $owner = "voxel"
    $nagios_ping_rate = '!450.0,20%!700.0,60%'
    include smokeping::slave
    include nagios_services
    include set_local_settings
}

node 'neotelecoms01' inherits ringnode {
    $owner = "neotelecoms"
    include smokeping::slave
    include nagios_services
    include set_local_settings
}
