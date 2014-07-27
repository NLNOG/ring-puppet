class ring_sqa {

    package { 'ring-sqa':
        ensure      => 'latest',
        provider    => 'gem',
        require     => [Alternatives['ruby'], Alternatives['gem'], Package['libsqlite3-dev']],
    }

    package { 'SyslogLogger':
        ensure      => 'latest',
        provider    => 'gem',
        require     => Alternatives['gem'],
    }

    alternatives { 'ruby':
        path    => '/usr/bin/ruby1.9.1',
        require => Package['ruby1.9.3'],
    }

    alternatives { 'gem':
        path    => '/usr/bin/gem1.9.1',
        require => Package['ruby1.9.3'],
    }

    file { "/etc/ring-sqa":
        ensure  => directory,
    }

    file { "/etc/ring-sqa/main.conf":
        source  => "puppet:///ring_sqa/main.conf",
        require => [Package['ring-sqa'], File["/etc/ring-sqa"]],
    }

    file { "/etc/init/ring-sqa.conf":
        ensure  => absent,
    }

    file { "/etc/init/ring-sqa4.conf":
        source => "puppet:///ring_sqa/upstart-ring-sqa4.conf",
    }

    file { "/etc/init/ring-sqa6.conf":
        source => "puppet:///ring_sqa/upstart-ring-sqa6.conf",
    }

    service { "ring-sqa":
        ensure      => 'stopped',
        provider    => 'upstart',
    }
    
    service { "ring-sqa4":
        ensure      => 'running',
        provider    => 'upstart',
        require     => [Package['ring-sqa'], File['/etc/init/ring-sqa4.conf']],
        subscribe   => File["/etc/ring-sqa/main.conf"],
        restart     => "restart ring-sqa4",
    }

    service { "ring-sqa6":
        ensure      => 'running',
        provider    => 'upstart',
        require     => [Package['ring-sqa'], File['/etc/init/ring-sqa6.conf']],
        subscribe   => File["/etc/ring-sqa/main.conf"],
        restart     => "restart ring-sqa6",
    }

}
