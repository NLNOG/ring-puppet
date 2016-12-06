class salt {
    package {["salt-minion"]:
        ensure  => absent,
        before => File["/etc/salt/minion"],
    }
    
    file {"/etc/salt/minion":
        ensure  => absent,
    }
    
    file {"/etc/salt/minion_id":
        ensure => absent,
    }
    
    file {"/etc/salt":
        ensure => absent,
    }

}
