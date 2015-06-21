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

}
