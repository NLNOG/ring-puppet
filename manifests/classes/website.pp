class website {
    
    # Apache config
    file { "/etc/apache2/sites-available/ring.nlnog.net":
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/etc/apache2/sites-available/ring.nlnog.net",
        notify  => Service["apache2"]
    }

   # central sqa collector
   file { "/etc/apache2/sites-available/sqa-collector.infra.ring.nlnog.net":
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/etc/apache2/sites-available/sqa-collector.infra.ring.nlnog.net",
        notify  => Service["apache2"]
    }
    
    # Participants list
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

    # API
    file { "/var/www/ring.nlnog.net/api/api.wsgi":
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/var/www/ring.nlnog.net/api/api.wsgi",
        notify  => Service["apache2"]
    }
    
    file { "/var/www/ring.nlnog.net/api/ring_api.py":
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/var/www/ring.nlnog.net/api/ring_api.py",
        notify  => Service["apache2"]
    }
    
    # SQA Collector
    file { "/var/www/ring.nlnog.net/sqa_collector/sqa.wsgi":
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/var/www/ring.nlnog.net/sqa_collector/sqa.wsgi",
        notify  => Service["apache2"]
    }
    
    file { "/var/www/ring.nlnog.net/sqa_collector/sqa_collector.py":
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/var/www/ring.nlnog.net/sqa_collector/sqa_collector.py",
        notify  => Service["apache2"]
    }

    file { "/var/www/ring.nlnog.net/sqa_collector/sqa_collector_db.py":
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/var/www/ring.nlnog.net/sqa_collector/sqa_collector_db.py",
        notify  => Service["apache2"]
    }


}
