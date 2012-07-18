class resolving {
 
$etcresolvconf = "search ring.nlnog.net
nameserver 127.0.0.1
nameserver ::1
"
    file { "/etc/resolv.conf":
        owner   => root,
        group   => root,
        mode    => 644,
        require => [ Package["unbound"], File["/etc/unbound/unbound.conf"] ],
        content => $etcresolvconf,
   }

    package { "unbound":
        ensure => latest,
        before  => File["/etc/init.d/unbound"],
    }

    file { "/etc/init/unbound.conf":
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/etc/init/unbound.conf",
    }

    file { "/etc/init.d/unbound":
        ensure  => absent,
    }

    service { "unbound":
        ensure      => running,
        require     => [ Package["unbound"], File["/etc/init/unbound.conf"] ],
        provider    => upstart,
        subscribe   => File["/etc/unbound/unbound.conf"],
    }

    file { "/etc/unbound/unbound.conf":
        owner   => root,
        group   => root,
        mode    => 0644,
        require => Package["unbound"],
        source  => $lsbdistcodename ? {
            maverick    => "puppet:///files/etc/unbound/unbound.conf.maverick",
            precise     => "puppet:///files/etc/unbound/unbound.conf.precise",
        }
    }

}
