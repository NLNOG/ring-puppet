class bird_peers {

######
# add IPv4 peers here
# format is DESCR,IPv6,ASN
# note that DESCR must not contain spaces or other weird shit
#####

$lg_peers_v4 = [
    'BIT1,213.136.1.132,12859',
    'TUXIS1,31.3.104.1,197731',
]

#####
# add IPv6 peers here
# format is DESCR,IPv6,ASN
# note that DESCR must not contain spaces or other weird shit
#####

$lg_peers_v6 = [
    'BIT1,2001:7b8:0:fffe::2,12859',
    'TUXIS1,2a03:7900::1,197731',
]

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

    package { ["bird", "bird6"]:
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
        source  => "puppet:///files/etc/init/bird.conf",
    }

    file { "/etc/init/bird6.conf":
        ensure  => file,
        mode    => 0644,
        owner   => root,
        group   => root,
        source  => "puppet:///files/etc/init/bird6.conf",
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
        content => template("bird.conf.rb"),
        ensure  => file,
    }
    
    file { "/etc/bird6.conf":
        owner   => root,
        group   => root,
        mode    => 0755,
        content => template("bird6.conf.rb"),
        ensure  => file,
    }

    file { "/usr/local/bin/birdshell":
        owner   => root,
        group   => root,
        mode    => 0755,
        source  => "puppet:///files/usr/local/bin/birdshell",
        ensure  => file,
    }

    line { "birdshell_in_shells":
        file    => "/etc/shells",
        line    => "/usr/local/bin/birdshell",
        ensure  => present,
    }

}
