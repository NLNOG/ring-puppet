class etcfiles {

# in case of problems this can force my key everywhere
#     file { "/home/job/.ssh/authorized_keys":
#        owner   => job,
#        group   => job,
#        mode    => 600,
#        source  => "puppet:///files/home/job/.ssh/authorized_keys"
#    } 

    
    # remove this file so it does not warn people a new
    # release is available - we will upgrade in 2012
    file { "/etc/update-motd.d/91-release-upgrade":
        ensure => absent,
    }

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
        source  => "puppet:///files/etc/resolv.conf",
    } 

     file { "/etc/pam.d/atd":
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/etc/pam.d/atd",
    }

     file { "/etc/pam.d/cron":
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/etc/pam.d/cron",
    }

     file { "/etc/pam.d/login":
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/etc/pam.d/login",
    }

     file { "/etc/pam.d/sshd":
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/etc/pam.d/sshd",
    }

     file { "/etc/pam.d/su":
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/etc/pam.d/su",
    } 


   file { "/etc/apt/sources.list":
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/etc/apt/sources.list.${lsbdistcodename}",
    }

    file { "/etc/apt/apt.conf.d/10periodic":
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/etc/apt/apt.conf.d/10periodic"
    }

    file { "/etc/apt/apt.conf.d/50unattended-upgrades":
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/etc/apt/apt.conf.d/50unattended-upgrades"
    }
}

class timezone {
    file { 
        "/etc/localtime": 
            ensure => "/usr/share/zoneinfo/UTC",
    } 
    file { 
        "/etc/timezone": 
            content => "Etc/UTC\n",
    } 
}

class local_binaries {
    file { "/usr/local/bin/ring-ping":
        owner   => root,
        group   => root,
        mode    => 0755,
        source  => "puppet:///files/usr/local/bin/ring-ping"
    }
 
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
        ensure  => absent,
    }
    
    file { "/usr/local/bin/ring-convert-ssh-keys":
        owner   => root,
        group   => root,
        mode    => 0755,
        source  => "puppet:///files/usr/local/bin/ring-convert-ssh-keys"
    }
    
#    file { "/etc/postfix/main.cf":
#        owner   => root,
#        group   => root,
#        mode    => 0755,
#        source  => "puppet:///files/etc/postfix/main.cf"
#    }
}

