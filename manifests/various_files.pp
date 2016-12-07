# Class: etcfiles
#
class etcfiles {

    file { ['/etc/apt/sources.list.d/master.ring.nlnog.net.list', '/etc/apt/sources.list.d/amp.list']:
        ensure  => absent,
    }

# in case of problems this can force my key everywhere
#     file { "/home/job/.ssh/authorized_keys":
#        owner   => job,
#        group   => job,
#        mode    => 600,
#        source  => "puppet:///files/home/job/.ssh/authorized_keys"
#    } 

    file { "/etc/default/puppet":
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/etc/default/puppet"
    } 

     file { "/etc/sysctl.d/30-disable-accepting-ipv6-ra.conf":
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/etc/sysctl.d/30-disable-accepting-ipv6-ra.conf",
    }
     
     file { "/etc/sysctl.d/10-ipv6-privacy.conf":
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/etc/sysctl.d/10-ipv6-privacy.conf",
    }

    file { ["/var/log/syslog", "/var/log/messages", "/var/log/user.log", "/var/log/secure", "/var/log/mail.log", "/var/log/mail.err", "/var/log/mail.info", "/var/log/kern.log", "/var/log/error", "/var/log/dmesg", "/var/log/debug.log", "/var/log/daemon.log", "/var/log/cron", "/var/log/auth.log"]:
        owner   => root,
        group   => adm,
    }

    file { "/opt/root-anchor":
        owner   => root,
        group   => root,
        mode    => 0644,
        source  => "puppet:///files//opt/root-anchor",
    }
}

class etcfiles_ring {
    file { "/etc/network/if-up.d/syslog-ng":
        owner   => root,
        group   => root,
        mode    => 755,
        source  => "puppet:///files/etc/if-up.d/syslog-ng"
    }
}

class puppetbinaries {
    
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
    file { "/usr/local/bin/puppet_zombiecleanup":
        owner   => root,
        group   => root,
        mode    => 0755,
        source  => "puppet:///files/usr/local/bin/puppet_zombiecleanup",
        ensure => present,
    }

}

