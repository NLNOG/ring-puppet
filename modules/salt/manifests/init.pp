class salt {
    package {"salt":
        ensure  => installed,
    }
    
    apt::ppa { 'ppa:saltstack/salt':
        before => Package["salt"],
    }

    file {"/etc/salt/minion":
        content => "master_finger: '54:8b:81:be:b3:b8:39:df:e0:de:bf:55:03:b1:9b:f3'",
    }
}
