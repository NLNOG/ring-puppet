class salt {
    package {["salt-minion"]:
        ensure  => purged,
    }
    package {["salt-common"]:
        ensure  => purged,
    }
    
    file {"/etc/salt":
        ensure => absent,
        recurse => true,
        purge => true,
        force => true,
    }

}
