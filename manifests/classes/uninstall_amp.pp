class uninstall_amp {

    file { '/home/measure':
        ensure => absent,
        path => '/home/measure',
        recurse => true,
        purge => true,
        force => true,
   }

    user { 'measure':
        ensure => absent,
    }

    package { ['amplet-common', 'amplet-client']:
        ensure  => purged,
    }
}
