# Class: etcfiles
#
class etcfiles {

# in case of problems this can force my key everywhere
#     file { "/home/job/.ssh/authorized_keys":
#        owner   => job,
#        group   => job,
#        mode    => 600,
#        source  => "puppet:///files/home/job/.ssh/authorized_keys"
#    } 


    file { "/etc/default/locale":
        owner   => root,
        group   => root,
        mode    => 0644,
        content => "LANG=\"en_US.UTF-8\"",
        ensure  => file,
    }

    file { "/var/lib/locales/supported.d/local":
        owner   => root,
        group   => root,
        mode    => 0644,
        source  => "puppet:///files/var/lib/locales/supported.d/local",
        ensure  => file,
    }

       
    exec { "update-locale":
        subscribe   => [ File["/etc/default/locale"], File["/var/lib/locales/supported.d/local"] ],
        command     => "locale-gen",
        refreshonly => true,
        environment => "LANG=\"en_US.UTF-8\"",
    }
    

    file { "/lib/init/upstart-job":
        owner   => root,
        group   => root,
        mode    => 0755,
        source  => $lsbdistcodename ? {
            maverick    => "puppet:///files/lib/init/upstart-job.maverick",
            precise     => "puppet:///files/lib/init/upstart-job.precise",
        }
    }


    file { "/etc/bash.bashrc":
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/etc/bash.bashrc"
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

    file { "/etc/ssh/ssh_config":
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/etc/ssh/ssh_config"
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

     file { "/etc/pam.d/atd":
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/etc/pam.d/atd",
    }

    file { "/etc/cron.d/munin-node":
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/etc/cron.d/munin-node",
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

    exec { "apt-get update":
        path    => ["/usr/bin", "/usr/sbin"],
        subscribe => File["/etc/apt/sources.list"],
        refreshonly => true
    }

   file { "/etc/apt/sources.list":
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/etc/apt/sources.list.${lsbdistcodename}",
    }

    file { "/etc/apt/sources.list.d/master.ring.nlnog.net.list":
        owner => root,
        group => root,
        mode  => 644,
        source => "puppet:///files/etc/apt/sources.list.d/master.ring.nlnog.net.list",
    }

    file { "/etc/apt/apt.conf.d/10periodic":
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/etc/apt/apt.conf.d/10periodic"
    }

     file { "/etc/sysctl.d/30-disable-accepting-ipv6-ra.conf":
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/etc/sysctl.d/30-disable-accepting-ipv6-ra.conf",
    }

    file { "/etc/apt/apt.conf.d/50unattended-upgrades":
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/etc/apt/apt.conf.d/50unattended-upgrades"
    }

    file { ["/var/log/syslog", "/var/log/messages", "/var/log/user.log", "/var/log/secure", "/var/log/mail.log", "/var/log/mail.err", "/var/log/mail.info", "/var/log/kern.log", "/var/log/error", "/var/log/fail2ban.log", "/var/log/dmesg", "/var/log/debug.log", "/var/log/daemon.log", "/var/log/cron", "/var/log/auth.log"]:
        owner   => root,
        group   => adm,
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
    file { "/usr/local/lib/site_ruby/ring.rb":
        owner   => root,
        group   => root,
        mode    => 0755,
        source  => "puppet:///files/usr/local/lib/site_ruby/ring.rb"
    }
    file { "/usr/local/bin/ring-uping":
        owner   => root,
        group   => root,
        mode    => 0755,
        source  => "puppet:///files/usr/local/bin/ring-uping"
    }
    file { "/usr/local/bin/ring-ping":
        owner   => root,
        group   => root,
        mode    => 0755,
        source  => "puppet:///files/usr/local/bin/ring-ping"
    }
     file { "/usr/local/bin/ring-http":
        owner   => root,
        group   => root,
        mode    => 0755,
        source  => "puppet:///files/usr/local/bin/ring-http"
    }
     file { "/usr/local/bin/ring-all-serial":
        owner   => root,
        group   => root,
        mode    => 0755,
        source  => "puppet:///files/usr/local/bin/ring-all-serial"
    }
     file { "/usr/local/bin/ring-all.old":
        ensure => absent,
    }
 
    file { "/usr/local/bin/ring-all":
        owner   => root,
        group   => root,
        mode    => 0755,
        source  => "puppet:///files/usr/local/bin/ring-all"
    }
     file { "/usr/local/bin/ring-trace":
        owner   => root,
        group   => root,
        mode    => 0755,
        source  => "puppet:///files/usr/local/bin/ring-trace"
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
        source  => "puppet:///files/usr/local/bin/ring-convert-ssh-keys",
    }
    file { "/usr/local/bin/ring-puppet-repo-sync":
        owner   => root,
        group   => root,
        mode    => 0755,
        source  => "puppet:///files/usr/local/bin/ring-puppet-repo-sync",
        ensure => present,
    }
}

