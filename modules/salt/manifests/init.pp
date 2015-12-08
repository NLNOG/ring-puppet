class salt {
    package {["salt-minion"]:
        ensure  => installed,
    }
    
    apt::ppa { 'ppa:saltstack/salt':
        before => Package["salt-minion"],
    }

    file {"/etc/salt/minion":
        content => "master_finger: '54:8b:81:be:b3:b8:39:df:e0:de:bf:55:03:b1:9b:f3'",
        after => Package["salt-minion"],
        notify => Service["salt-minion"],
    }

    service { 'salt-minion':
        ensure  => running,
        enable  => true,
        subscrube => File["/etc/salt/minion"],
        require => Package["salt-minion"],
    }
}
