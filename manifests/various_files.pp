class etcfiles {
    file { "/etc/hosts":
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/etc/hosts"
    }

    file { "/etc/sudoers":
        owner   => root,
        group   => root,
        mode    => 440,
        source  => "puppet:///files/etc/sudoers"
    }

    file { "/etc/default/puppet":
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/etc/default/puppet"
    } 


    file { "/etc/ssh/sshd_config":
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/etc/ssh/sshd_config"
    } 

    service { ssh:
        ensure => running,
        subscribe => File["/etc/ssh/sshd_config"],
        hasrestart => true,
    }

    file { "/etc/resolv.conf":
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/etc/resolv.conf"
    } 

    file { "/etc/apt/sources.list":
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/etc/apt/sources.list",
    }

    file { "/etc/apt/apt.conf.d/10periodic":
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/etc/apt/apt.conf.d/10periodic"
    }
}

class local_binaries {
    file { "/usr/local/bin/ring-all":
        owner   => root,
        group   => root,
        mode    => 0755,
        source  => "puppet:///files/usr/local/bin/ring-all"
    }
    
     file { "/usr/local/bin/generate-hosts.py":
        owner   => root,
        group   => root,
        mode    => 0755,
        source  => "puppet:///files/usr/local/bin/generate-hosts.py"
    }
 
     file { "/usr/local/bin/ring-rsync-ssh-keys":
        owner   => root,
        group   => root,
        mode    => 0755,
        source  => "puppet:///files/usr/local/bin/ring-rsync-ssh-keys"
    }
}

