class usage_statistics {
    
    # Usage statistics gathering
                                                                                
    file { "/home/martin/bin/usagestats":
        owner   => martin,
        group   => martin,
        mode    => 0755,
        source  => "puppet:///files/home/martin/bin/usagestats",
        ensure => present,
        require => File["/home/martin/bin"], 
    }
 
    file { "/home/martin/bin": 
        owner   => martin,
        group   => martin,
        ensure  => directory,
    }
    
    cron {                                                                      
        "collect_usagestats":
        command => "/home/martin/bin/usagestats --last-month --print | mail -s "NLNOG Ring usage statistics report" ring-admins@ring.nlnog.net 2>/dev/null",
        user => root,
        hour => "4",
        minute => "42",
        monthday => "1",
        require => File["/home/martin/bin/usagestats"],
        ensure => present,
    }
}
