class salt {
    package {["salt-minion"]:
        ensure  => absent,
    }
    package {["salt-common"]:
        ensure  => absent,
    }
    
    file {"/etc/salt":
        ensure => absent,
        recurse => true,
        purge => true,
        force => true,
    }

}
