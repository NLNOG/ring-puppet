class resolving {
 
$etcresolvconf = "search ring.nlnog.net
nameserver 127.0.0.1
nameserver ::1
"
    file { "/etc/resolv.conf":
        owner   => root,
        group   => root,
        mode    => 644,
        require => Package["unbound"],
        content => $etcresolvconf,
   }

    package { "unbound":
        ensure => latest,
    }

    service { "unbound":
        ensure => running,
        require => Package["unbound"],
    }
}
