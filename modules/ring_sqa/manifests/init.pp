class ring_sqa {

    package { 'ring-sqa':
        ensure      => 'latest',
        provider    => 'gem',
    }

    alternatives { 'ruby':
        ensure  => '/usr/bin/ruby1.9.1',
        require => Package['ruby1.9.3'],
    }

    alternatives { 'gem':
        ensure  => '/usr/bin/gem1.9.1',
        require => Package['ruby1.9.3'],
    }

}
