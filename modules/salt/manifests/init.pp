class salt {
    package {["salt-minion"]:
        ensure  => latest,
        before => File["/etc/salt/minion"],
    }
    
    file {"/etc/salt/minion":
        content => "master_finger: '39:ea:41:f1:3d:d5:4b:32:bb:1a:a1:ff:27:0e:08:7e:89:cd:8c:75:c5:f7:0e:f3:cd:19:53:98:e6:01:55:fe'
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
