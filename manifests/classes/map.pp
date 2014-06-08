class map {
    
    # Apache config
    file { "/etc/apache2/sites-available/map.ring.nlnog.net":
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/etc/apache2/sites-available/map.ring.nlnog.net",
        notify  => Service["apache2"]
    }
    
}
