class ring_sqa {

    package { 'ring-sqa':
        ensure      => 'latest',
        provider    => 'gem',
        require     => [Alternatives['ruby'], Alternatives['gem'], Package['libsqlite3-dev']],
    }

    alternatives { 'ruby':
        path    => '/usr/bin/ruby1.9.1',
        require => Package['ruby1.9.3'],
    }

    alternatives { 'gem':
        path    => '/usr/bin/gem1.9.1',
        require => Package['ruby1.9.3'],
    }

    file { "/etc/ring-sqa/config":
        source => "puppet:///ring_sqa/config",
        require => Package['ring-sqa'],
    }

    file { "/etc/init/ring-sqa.conf":
        source => "puppet:///ring_sqa/upstart-ring-sqa.conf",
    }

    service { "ring-sqa":
        ensure      => 'running',
        provider    => 'upstart',
        require     => [Package['ring-sqa'], File["/etc/ring-sqa/config"]],
    }
}
