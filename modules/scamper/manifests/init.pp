class scamper {

    package { 'scamper':
        ensure      => 'latest',
    }

    file { "/etc/init/scamper.conf":
        source => "puppet:///scamper/upstart-scamper.conf",
    }

    file { "/home/scamper/run-traces.sh":
        source => "puppet:///scamper/run-traces.sh",
        owner => "scamper",
        group => "scamper",
        mode => "0755",
        require => User["scamper"],
    }

    service { "scamper":
        ensure      => 'running',
        provider    => 'upstart',
        require     => [Package['scamper'], File['/etc/init/scamper.conf']],
        restart     => "restart scamper",
        subscribe   => File["/etc/init/scamper.conf"],
    }

    file { "/home/scamper/collected/":
        ensure => directory,
        owner => "scamper",
        group => "scamper",
        require => User["scamper"],
    }

    $first = fqdn_rand(30)
    $second = (fqdn_rand(30) + 30)

    cron { "collect_all_traces":
        user => "scamper",
        command => "/home/scamper/run-traces.sh",
        minute => [$first, $second],
        hour => "*",
        require => [Service["scamper"], File["/home/scamper/collected/"], File["/home/scamper/run-traces.sh"]],
    }

    cron { "clean_scamper":
        user => "scamper",
        command => "find /home/scamper/collected/* -mtime +8 -exec rm {} \;",
        minute => "10",
        hour => "00",
        require => FIle["/home/scamper/collected/"],
    }
}
