class scamper {

    package { 'scamper':
        ensure      => 'latest',
    }

    file { "/etc/init/scamper.conf":
        source => "puppet:///scamper/upstart-scamper.conf",
    }

    service { "scamper":
        ensure      => 'running',
        provider    => 'upstart',
        require     => [Package['scamper'], File['/etc/init/scamper.conf']],
        restart     => "restart scamper",
    }

    file { "/home/scamper/collected/":
        ensure => directory,
        owner => "scamper",
        group => "scamper",
        require => User["scamper"],
    }

    cron { "collect_all_traces":
        user => "scamper",
        command => "/usr/bin/sc_attach -p 23456 -c trace -i /etc/ring/node-list.txt -o /home/scamper/collected/$(hostname)-$(date +%s).warts; chmod +r /home/scamper/collected/*",
        minute => "00,30",
        hour => "*",
        require => [Service["scamper"], File["/home/scamper/collected/"]],
    }
}
