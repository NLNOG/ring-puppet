class ring_sqa {

    package { 'ring-sqa':
        ensure      => 'latest',
        provider    => 'gem',
        require     => Alternatives['ruby'],
    }

    alternatives { 'ruby':
        path    => '/usr/bin/ruby1.9.1',
        require => Package['ruby1.9.3'],
    }

    alternatives { 'gem':
        path    => '/usr/bin/gem1.9.1',
        require => Package['ruby1.9.3'],
    }

    alternatives { 'irb':
        path    => '/usr/bin/irb1.9.1',
        require => Package['ruby1.9.3'],
    }

    alternatives { 'rdoc':
        path    => '/usr/bin/rdoc1.9.1',
        require => Package['rdoc1.9.3'],
    }
}
