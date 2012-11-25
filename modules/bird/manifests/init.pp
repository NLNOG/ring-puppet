class bird_peers {

######
# add IPv4 peers here
# format is DESCR,IPv6,ASN
# note that DESCR must not contain spaces or other weird shit like dashes
#####

$lg_peers_v4 = [
'BIT1,213.136.1.132,12859',
'BLIX1,178.255.145.243,50304',
'BOXED_IT1,195.200.224.1,50156',
'COLOCLUE1,94.142.247.1,8283',
'DUOCAST1,89.188.4.1,31477',
'DUOCAST2,89.188.4.2,31477',
'GBXS1,193.27.64.13,9009',
'LEASEWEB1,62.212.80.80,16265',
'LEASEWEB2,85.17.100.100,16265',
'SPACEDUMP1,212.63.222.254,30880',
'TDC1,194.100.40.50,3292',
'TETANEUTRAL1,91.224.149.152,197422',
'TILAA1,164.138.24.1,196752',
'TILAA2,164.138.24.4,196752',
'TUXIS1,31.3.104.1,197731',
'YACAST1,213.205.109.251,24963',
'YOURORG1,216.14.98.5,19255',
'BELWUE1,129.143.4.244,553',
'GO6LAB1,91.239.96.216,198644',
'SIDN1,193.176.144.93,1140',
'EDUTEL1,88.159.0.21,39309',
'NETSIGN1,217.115.0.3,31078',
'OBENETWORK1,46.227.64.252,197595',
'ATRATO1,80.94.64.18,5580',
'ATRATO2,80.94.64.11,5580',
'TEAMIX1,194.150.191.249,33988',
'HOSTWAY1,64.40.105.22,14280',
'EBAYCLASSIFIEDSGROUP1,194.50.69.218,41552',
'SOFTLAYER1,50.97.16.40,36351',
'INDIT1,178.16.220.2,30893',
'WIREHIVE1,134.0.17.140,56730',
]

#####
# add IPv6 peers here
# format is DESCR,IPv6,ASN
# note that DESCR must not contain spaces or other weird shit
#####

$lg_peers_v6 = [
'BIT1,2001:7b8:0:fffe::2,12859',
'TUXIS1,2a03:7900::1,197731',
'BLIX1,2A02:20C8:1F:1::4,50304',
'BOXED_IT1,2001:67c:344::1,50156',
'COLOCLUE1,2a02:898:0:300::1,8283',
'DUOCAST1,2A01:01B0:1::1,31477',
'DUOCAST2,2A01:01B0:1::2,31477',
'GBXS1,2a01:300::13,9009',
'LEASEWEB1,2001:1af8::62:212:80:80,16265',
'LEASEWEB2,2001:1af8::85:17:100:100,16265',
'OCCAID1,2001:4830:1::7,30071',
'SPACEDUMP1,2A01:298:FFFF:5::1,30880',
'TDC1,2001:6E8:8C0:100::2,3292',
'TETANEUTRAL1,2a01:6600:8081:9800::1,197422',
'TILAA1,2a02:2770:1::1,196752',
'TILAA2,2a02:2770:1::4,196752',
'YACAST1,2a02:3e8::4,24963',
'YOURORG1,2001:4978:1:10::ffff,19255',
'BELWUE1,2001:7c0:0:1000::1,553',
'GO6LAB1,2001:67C:27E4:1::7606,198644',
'SIDN1,2a00:d78::193:176:144:93,1140',
'EDUTEL1,2a01:670::21,39309',
'NETSIGN1,2A00:1328:E00E::3,31078',
'OBENETWORK1,2A03:8600:8600:1::1,197595',
'ATRATO1,2a02:d28:5580::12,5580',
'ATRATO2,2a02:d28:5580::b,5580',
'TEAMIX1,2001:67c:14c:ff00::1,33988',
'HOSTWAY1,2606:6a00::e,14280',
'EBAYCLASSIFIEDSGROUP1,2001:67C:2D0::218,41552',
'SOFTLAYER1,2607:F0D0:2:3::1A,36351',
'WIREHIVE1,2a03:b980:102::c1,56730',
]

###### END_MARKER #####

}

class bird {
    include bird_peers
    exec { "add_bird_repo":
        path    => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
        timeout => 3600,
        command => "add-apt-repository -y ppa:cz.nic-labs/bird; apt-get update",
        unless  => "/usr/bin/test -f /etc/apt/sources.list.d/cz_nic-labs-bird-precise.list",
        before  => Package["bird", "bird6"],
    }

    package { ["bird", "bird6", "dialog"]:
        ensure => latest,
    }
    
   file { ["/etc/init.d/bird","/etc/init.d/bird6"]:
        ensure  => absent,
    }

    file { "/etc/init/bird.conf":
        ensure  => file,
        mode    => 0644,
        owner   => root,
        group   => root,
        source  => "puppet:///bird/upstart-bird.conf",
    }

    file { "/etc/init/bird6.conf":
        ensure  => file,
        mode    => 0644,
        owner   => root,
        group   => root,
        source  => "puppet:///bird/upstart-bird6.conf",
    }

    service { "bird":
        ensure      => running,
        subscribe   => File["/etc/bird.conf"],
        require     => File["/etc/init/bird.conf"],
        provider    => "upstart",
        hasstatus   => true,
        restart     => "service bird reload",
    }

    service { "bird6":
        ensure      => running,
        subscribe   => File["/etc/bird6.conf"],
        require     => File["/etc/init/bird6.conf"],
        provider    => "upstart",
        restart     => "service bird6 reload",
        hasstatus   => true,
    }

    file { "/etc/bird.conf":
        owner   => root,
        group   => root,
        mode    => 0755,
        content => template("bird/bird.conf.rb"),
        ensure  => file,
    }
    
    file { "/etc/bird6.conf":
        owner   => root,
        group   => root,
        mode    => 0755,
        content => template("bird/bird6.conf.rb"),
        ensure  => file,
    }

    file { "/usr/local/bin/birdshell":
        owner   => root,
        group   => root,
        mode    => 0755,
        source  => "puppet:///bird//birdshell",
        ensure  => file,
    }

    line { "birdshell_in_shells":
        file    => "/etc/shells",
        line    => "/usr/local/bin/birdshell",
        ensure  => present,
    }

}
