class website {
    
    # Stuff for the ring.nlnog.net website
    file { "/usr/local/bin/generate-participantsjs":
        owner   => root,
        group   => root,
        mode    => 0755,
        source  => "puppet:///files/usr/local/bin/generate-participantsjs",
        ensure => present,
    }
                                                                             
    cron {                                                                      
        "generate-participantsjs":
        command => "/usr/local/bin/generate-participantsjs",
        user => root,
        minute => "03",
        require => File["/usr/local/bin/generate-participantsjs"],
        ensure => present,
    }
}
