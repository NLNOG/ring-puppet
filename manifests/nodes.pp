# nodes.pp
#
## Hosts

node basenode {
    include users::virtual::ring_admins
    include cronjobs
    include groups
    include nettools
    include etcfiles
    include local_binaries
    include munin::client
    include nlnogrepokey
    include lang
    munin::plugin { ["users", "tcp", "ntp_offset", "uptime", "threads", "ntp_kernel_pll_off", "diskstats", "proc_pri", "iostat_ios"]:
    }
    munin::plugin { ["if_eth0"]:
        ensure => "if_" 
    }
    munin::plugin { ["if_err_eth0"]:
        ensure => "if_err_" 
    }
    include ssh
    include timezone
    include fail2ban-whitelist
    $postfix_smtp_listen = "127.0.0.1"
    $root_mail_recipient = "ring-admins@ring.nlnog.net"
    $postfix_myorigin = ""
    include postfix
    include resolving
}

node ringnode inherits basenode {
    include users::virtual::ring_users
    include no-apache2
    include syslog_ng::client
    include nodesonlycron
    include uva_research
    package{ "munin": ensure => purged, }
}

node 'master01' inherits basenode {
    include users
    include munin::host
    include master_software
    include syslog_ng::server
    include apache2
    include mastercronjobs
    include usage_statistics
    include nagios::defaults
    include nagios::headless
    include nagios_services
    nagios::service::http { $name:
        check_domain => "${name}"
    }
    include nagios::target::fqdn
    munin::plugin { ["apache_accesses", "apache_processes", "apache_volume"]:
    }

}

node 'worker01' inherits basenode {
    include users
    include syslog_ng::server
    include apache2
    include nagios_services
    include nagios::target::fqdn
    $sp_owner = "NLNOG RING"
    $sp_owner_email = "ring-admins@ring.nlnog.net"
    $sp_cgi_url = "http://worker01.ring.nlnog.net/smokeping/smokeping.fcgi"
    $sp_mailhost = "127.0.0.1"
    include smokeping::master

   nagios::service::http { $name:
        check_domain => "${name}"
    }
    munin::plugin { ["apache_accesses", "apache_processes", "apache_volume"]:
    }
}

node 'worker02' inherits basenode {
    include users
    include syslog_ng::server
    include apache2
    include nagios_services
    include nagios::target::fqdn
    nagios::service::http { $name:
        check_domain => "${name}"
    }
    munin::plugin { ["apache_accesses", "apache_processes", "apache_volume"]:
    }
}

# we don't want apache running on regular ringnodes. smokeping installs 
# apache, so we just force it down here. 
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
        require => Package["apache2"],
    }
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

### provide class to realise users

class users {
    Add_user <| groups == "ring-admins" or groups == "ring-users" |>
}

#### staging #####

node 'staging01' inherits ringnode {
    $owner = "job"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'staging02' inherits ringnode {
    $owner = "job"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

#### einde staging #####

#### define all ring nodes ####

node 'intouch01' inherits ringnode {
    $owner = "intouch"
    $location = "52.355930,4.951873"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'bit01' inherits ringnode {
    $owner = "bit"
    $location = "52.027596,5.624528"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'coloclue01' inherits ringnode {
    $owner = "coloclue"
    $location = "52.332901,4.919525"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'widexs01' inherits ringnode {
    $owner = "widexs"
    $location = "52.399982,4.842305"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'xlshosting01' inherits ringnode {
    $owner = "xlshosting"
    $location = "52.332912,4.919461"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'interconnect01' inherits ringnode {
    $owner = "interconnect"
    $location = "51.686672,5.359043"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'cambrium01' inherits ringnode {
    $owner = "cambrium"
    $location = "52.340988,5.227518"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'cyso01' inherits ringnode {
    $owner = "cyso"
    $location = "52.343983,4.828710"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'zylon01' inherits ringnode {
    $owner = "zylon"
    $location = "52.396420,4.851092"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'duocast01' inherits ringnode {
    $owner = "duocast"
    $location = "53.246086,6.528518"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'easyhosting01' inherits ringnode {
    $owner = "easyhosting"
    $location = "52.391132,4.665263"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'previder01' inherits ringnode {
    $owner = "previder"
    $location = "52.243954,6.767229"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'leaseweb01' inherits ringnode {
    $owner = "leaseweb"
    $location = "52.391224,4.665155"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'nxs01' inherits ringnode {
    $owner = "nxs"
    $location = "52.393200,4.847546"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'ic-hosting01' inherits ringnode {
    $owner = "ic-hosting"
    $location = "52.282215,4.772927"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'xs4all01' inherits ringnode {
    $owner = "xs4all"
    $location = "52.336353,4.886652"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'nedzone01' inherits ringnode {
    $owner = "nedzone"
    $location = "51.587601,4.305047"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'oxilion01' inherits ringnode {
    $owner = "oxilion"
    $location = "52.243969,6.767278"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'ebayclassifiedsgroup01' inherits ringnode {
    $owner = "ebayclassifiedsgroup"
    $location = "52.280964,4.754237"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'is01' inherits ringnode {
    $owner = "is"
    $location = "52.396759,4.838742"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'surfnet01' inherits ringnode {
    $owner = "surfnet"
    $location = "52.090767,5.112371"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'prolocation01' inherits ringnode {
    $owner = "prolocation"
    $location = "52.343983,4.828710"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'in2ip01' inherits ringnode {
    $owner = "in2ip"
    $location = "52.395855,4.841133"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'netground01' inherits ringnode {
    $owner = "netground"
    $location = "52.343983,4.828710"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'totaalnet01' inherits ringnode {
    $owner = "totaalnet"
    $location = "51.987831,5.933394"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'signet01' inherits ringnode {
    $owner = "signet"
    $location = "51.501537,5.460406"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'tripleit01' inherits ringnode {
    $owner = "tripleit"
    $location = "52.303066,4.937898"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'jaguarnetwork01' inherits ringnode {
    $owner = "jaguarnetwork"
    $location = "43.310226,5.373356"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'tuxis01' inherits ringnode {
    $owner = "tuxis"
    $location = "52.027649,5.624506"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'tenet01' inherits ringnode {
    $owner = "tenet"
    $location = "-26.204103,28.047304"
    $nagios_ping_rate = '!300.0,20%!500.0,60%'
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'bigwells01' inherits ringnode {
    $owner = "bigwells"
    $location = "41.892365,-87.634918"
    $nagios_ping_rate = '!250.0,20%!500.0,60%'
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'atrato01' inherits ringnode {
    $owner = "atrato"
    $location = "50.059772,14.480634"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'tdc01' inherits ringnode {
    $owner = "tdc"
    $location = "60.221024,24.848589"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'netability01' inherits ringnode {
    $owner = "netability"
    $location = "53.405754,-6.372293"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'unilogicnetworks01' inherits ringnode {
    $owner = "unilogicnetworks"
    $location = "50.996090,5.845644"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'maverick01' inherits ringnode {
    $owner = "maverick"
    $location = "52.393036,16.947895"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'acsystemy01' inherits ringnode {
    $owner = "acsystemy"
    $location = "53.910034,14.247578"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'netsign01' inherits ringnode {
    $owner = "netsign"
    $location = "52.465530,13.368666"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'rrbone01' inherits ringnode {
    $owner = "rrbone"
    $location = "51.188271,6.867769"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'hosteam01' inherits ringnode {
    $owner = "hosteam"
    $location = "52.227661,21.004250"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'msp01' inherits ringnode {
    $owner = "msp"
    $location = "51.525089,-0.072224"
    include smokeping::slave
    munin::plugin { ["sensors_volt", "sensors_temp", "sensors_fan"]:
        ensure => "sensors_" 
    }
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'inotel01' inherits ringnode {
    $owner = "inotel"
    $location = "52.391102,16.897284"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'fremaks01' inherits ringnode {
    $owner = "fremaks"
    $location = "53.077320,8.772950"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'blix01' inherits ringnode {
    $owner = "blix"
    $location = "59.924725,10.810183"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'portlane01' inherits ringnode {
    $owner = "portlane"
    $location = "59.306946,18.130274"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'solido01' inherits ringnode {
    $owner = "solido"
    $location = "55.728542,12.376454"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'digmia01' inherits ringnode {
    $owner = "digmia"
    $location = "48.119209,17.095844"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'rootlu01' inherits ringnode {
    $owner = "rootlu"
    $location = "49.671227,6.125205"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'globalaxs01' inherits ringnode {
    $owner = "globalaxs"
    $location = "53.461365,-2.324666"
    $nagios_ping_rate = '!200.0,20%!400.0,60%'
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'nebula01' inherits ringnode {
    $owner = "nebula"
    $location = "60.218018,24.879240"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'tilaa01' inherits ringnode {
    $owner = "tilaa"
    $location = "52.391090,4.665314"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'nautile01' inherits ringnode {
    $owner = "nautile"
    $location = "-22.267935,166.462219"
    $nagios_ping_rate = '!450.0,20%!700.0,60%'
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'voxel01' inherits ringnode {
    $owner = "voxel"
    $location = "37.241619,-121.783218"
    $nagios_ping_rate = '!250.0,20%!500.0,60%'
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'voxel02' inherits ringnode {
    $owner = "voxel"
    $location = "1.295461,103.789787"
    $nagios_ping_rate = '!550.0,20%!900.0,60%'
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'neotelecoms01' inherits ringnode {
    $owner = "neotelecoms"
    $location = "48.899693,2.296256"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'apnic01' inherits ringnode {
    $owner = "apnic"
    $location = "-27.458248,153.031067"
    $nagios_ping_rate = '!500.0,20%!800.0,60%'
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'atrato02' inherits ringnode {
    $owner = "atrato"
    $location = "40.717884,-74.008938"
    $nagios_ping_rate = '!200.0,20%!400.0,60%'
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'man-da01' inherits ringnode {
    $owner = "man-da"
    $location = "49.86170,8.68210"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'webair01' inherits ringnode {
    $owner = "webair"
    $location = "40.722529,-73.632961"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'concepts-ict01' inherits ringnode {
    $owner = "concepts-ict"
    $location = "51.592992,4.802703"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'dataoppdrag01' inherits ringnode {
    $owner = "dataoppdrag"
    $location = "60.295349,5.255753"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'tetaneutral01' inherits ringnode {
    $owner = "tetaneutral"
    $location = "43.61847,1.42075"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'jump01' inherits ringnode {
    $owner = "jump"
    $location = "51.5120776,-0.0020345"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'iway01' inherits ringnode {
    $owner = "iway"
    $location = "47.387639, 8.519944"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'timico01' inherits ringnode {
    $owner = "timico"
    $location = "53.07897,-0.792212"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'yacast01' inherits ringnode {
    $owner = "yacast"
    $location = "48.90541,2.369790"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'rezopole01' inherits ringnode {
    $owner = "rezopole"
    $location = "45.72289,4.861422"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'globalaxs02' inherits ringnode {
    $owner = "globalaxs"
    $location = "51.511526923,-0.0011855363845825195"
    $nagios_ping_rate = '!200.0,20%!400.0,60%'
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'solnet01' inherits ringnode {
    $owner = "solnet"
    $location = "47.20182,7.52878"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'boxed-it01' inherits ringnode {
    $owner = "boxed-it"
    $location = "50.881431,4.454129"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'spacenet01' inherits ringnode {
    $owner = "spacenet"
    $location = "48.133333,11.566667"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'mironet01' inherits ringnode {
    $owner = "mironet"
    $location = "47.5143,7.616726"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'seeweb01' inherits ringnode {
    $owner = "seeweb"
    $location = "45.478696,9.105091"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'networkdesign01' inherits ringnode {
    $owner = "networkdesign"
    $location = "47.38339,8.49560"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'zensystems01' inherits ringnode {
    $owner = "zensystems"
    $location = "55.7284634,12.376985"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'westnet01' inherits ringnode {
    $owner = "westnet"
    $location = "53.858024,-9.279904"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'kantonsschulezug01' inherits ringnode {
    $owner = "kantonsschulezug"
    $location = "47.1744,8.5233"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'filoo01' inherits ringnode {
    $owner = "filoo"
    $location = "50.09676,8.628393"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'nessus01' inherits ringnode {
    $owner = "nessus"
    $location = "48.179737,16.364007"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'amazon01' inherits ringnode {
    $owner = "amazon"
    $location = "38.944444,-77.455833"
    include smokeping::slave
    include nagios::target::fqdn
    $nagios_ping_rate = '!200.0,20%!300.0,60%'
    include nagios_services
    include set_local_settings
	include users

    # hopefully a temp fix because of:
    # https://bugs.launchpad.net/ubuntu/+source/linux/+bug/613273
    file { "/usr/share/initramfs-tools/scripts/init-bottom/udev":
        ensure  => present,
        mode    => 0755,
        owner   => root,
        group   => root,
        source  => "puppet:///files/usr/share/initramfs-tools/scripts/init-bottom/udev",
    }
}

node 'amazon02' inherits ringnode {
    $owner = "amazon"
    $location = "53.43333,-6.25000"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users

    # hopefully a temp fix because of:
    # https://bugs.launchpad.net/ubuntu/+source/linux/+bug/613273
    file { "/usr/share/initramfs-tools/scripts/init-bottom/udev":
        ensure  => present,
        mode    => 0755,
        owner   => root,
        group   => root,
        source  => "puppet:///files/usr/share/initramfs-tools/scripts/init-bottom/udev",
    }
}


node 'amazon03' inherits ringnode {
    $owner = "amazon"
    $location = "1.358816,103.9891"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    $nagios_ping_rate = '!550.0,20%!900.0,60%'
    include set_local_settings
	include users

    # hopefully a temp fix because of:
    # https://bugs.launchpad.net/ubuntu/+source/linux/+bug/613273
    file { "/usr/share/initramfs-tools/scripts/init-bottom/udev":
        ensure  => present,
        mode    => 0755,
        owner   => root,
        group   => root,
        source  => "puppet:///files/usr/share/initramfs-tools/scripts/init-bottom/udev",
    }
}

node 'amazon04' inherits ringnode {
    $owner = "amazon"
    $location = "35.765278, 140.385556"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    $nagios_ping_rate = '!550.0,20%!900.0,60%'
    include set_local_settings
	include users

    # hopefully a temp fix because of:
    # https://bugs.launchpad.net/ubuntu/+source/linux/+bug/613273
    file { "/usr/share/initramfs-tools/scripts/init-bottom/udev":
        ensure  => present,
        mode    => 0755,
        owner   => root,
        group   => root,
        source  => "puppet:///files/usr/share/initramfs-tools/scripts/init-bottom/udev",
    }
}

node 'amazon05' inherits ringnode {
    $owner = "amazon"
    $location = "45.588611, -122.5975"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    $nagios_ping_rate = '!300.0,20%!500.0,60%'
    include set_local_settings
	include users

    # hopefully a temp fix because of:
    # https://bugs.launchpad.net/ubuntu/+source/linux/+bug/613273
    file { "/usr/share/initramfs-tools/scripts/init-bottom/udev":
        ensure  => present,
        mode    => 0755,
        owner   => root,
        group   => root,
        source  => "puppet:///files/usr/share/initramfs-tools/scripts/init-bottom/udev",
    }
}

node 'amazon06' inherits ringnode {
    $owner = "amazon"
    $location = "37.618889, -122.375"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    $nagios_ping_rate = '!300.0,20%!500.0,60%'
    include set_local_settings
	include users

    # hopefully a temp fix because of:
    # https://bugs.launchpad.net/ubuntu/+source/linux/+bug/613273
    file { "/usr/share/initramfs-tools/scripts/init-bottom/udev":
        ensure  => present,
        mode    => 0755,
        owner   => root,
        group   => root,
        source  => "puppet:///files/usr/share/initramfs-tools/scripts/init-bottom/udev",
    }
}

node 'equinixnl01' inherits ringnode {
    $owner = "equinixnl"
    $location = "52.2373, 6.8496"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'lchost01' inherits ringnode {
    $owner = "lchost"
    $location = "51.496716,-0.017987"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'hostway01' inherits ringnode {
    $owner = "hostway"
    $location = "49.288462,-123.118197"
    $nagios_ping_rate = '!300.0,20%!500.0,60%'
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'pcextreme01' inherits ringnode {
    $owner = "pcextreme"
    $location = "52.400483,4.842865"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'antagonist01' inherits ringnode {
    $owner = "antagonist"
    $location = "52.244396,6.767321"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'nts01' inherits ringnode {
    $owner = "nts"
    $location = "46.936647,7.429907"
    include smokeping::slave
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'multiplay01' inherits ringnode {
    $owner = "multiplay"
    $location = "51.520493,-0.073546"
    include smokeping::slave                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'softlayer01' inherits ringnode {
    $owner = "softlayer"
    $location = "32.782778, -96.803889"
    $nagios_ping_rate = '!250.0,20%!400.0,60%'
    include smokeping::slave                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'imagine01' inherits ringnode {
    $owner = "imagine"
    $location = "53.334224, -6.365538"
    $nagios_ping_rate = '!250.0,20%!400.0,60%'
    include smokeping::slave                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'speedpartner01' inherits ringnode {
    $owner = "speedpartner"
    $location = "51.187842,6.866248"
    $nagios_ping_rate = '!250.0,20%!400.0,60%'
    include smokeping::slave                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'gossamerthreads01' inherits ringnode {
    $owner = "gossamerthreads"
    $location = "49.28496,-123.114411"
    $nagios_ping_rate = '!250.0,20%!400.0,60%'
    include smokeping::slave                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'towardex01' inherits ringnode {
    $owner = "towardex"
    $location = "42.354500508087064,-71.05950593948364"
    $nagios_ping_rate = '!250.0,20%!400.0,60%'
    include smokeping::slave                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'simplytransit01' inherits ringnode {
    $owner = "simplytransit"
    $location = "51.500544,-0.708647"
    include smokeping::slave                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'isarnet01' inherits ringnode {
    $owner = "isarnet"
    $location = "48.32839,11.74318"
    include smokeping::slave                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'strato01' inherits ringnode {
    $owner = "strato"
    $location = "52.465907,13.369467"
    include smokeping::slave                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

