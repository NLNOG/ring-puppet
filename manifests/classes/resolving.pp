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
        ensure  => absent,
    }

    file { "/etc/init.d/unbound":
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/etc/init.d/unbound",
    }


    service { "unbound":
        ensure      => running,
        require     => [ Package["unbound"], File["/etc/init.d/unbound"] ],
        subscribe   => File["/etc/unbound/unbound.conf"],
        hasrestart  => true,
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
