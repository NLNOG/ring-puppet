class motd {
    file { "/etc/update-motd.d/20-cpu-checker":                                  
        ensure => absent,                                                       
    }

    file { "/etc/update-motd.d/50-landscape-sysinfo":
        ensure => present,
        mode => 0755,
        source => "puppet:///files/etc/update-motd.d/50-landscape-sysinfo",
        require => Package["update-motd"],
    }
     file { "/etc/update-motd.d/60-node-information":
        ensure => present,
        mode => 0755,
        source => "puppet:///files/etc/update-motd.d/60-node-information",
        require => Package["update-motd"],
    }
     file { "/etc/update-motd.d/ring.nlnog.net-logo":
        ensure => present,
        mode => 0644,
        source => "puppet:///files/etc/update-motd.d/ring.nlnog.net-logo",
        require => Package["update-motd"],
    }
 
    file { "/etc/update-motd.d/91-release-upgrade":                             
        ensure => absent,                                                       
    }
}
