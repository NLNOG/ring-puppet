class salt {
    package {["salt-minion"]:
        ensure  => latest,
        before => File["/etc/salt/minion"],
    }
    
    file {"/etc/salt/minion":
        content => "master_finger: '54:8b:81:be:b3:b8:39:df:e0:de:bf:55:03:b1:9b:f3'
",
        notify => Service["salt-minion"],
    }
    
    file {"/etc/salt/minion_id":
        content => "$fqdn",
        notify => Service["salt-minion"],
    }

    service { 'salt-minion':
        ensure  => running,
        enable  => true,
        subscribe => File["/etc/salt/minion"],
        require => Package["salt-minion"],
    }
}
