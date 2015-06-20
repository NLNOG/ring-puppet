# Class: etcfiles
#
class etcfiles {

    apt::source { 'nlnog_ring_repo':
        location    => 'http://apt.ring.nlnog.net/deb/',
        release     => 'maverick',
        repos       => 'main',
        include_src => false,
    }

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

    file { "/lib/init/upstart-job":
        owner   => root,
        group   => root,
        mode    => 0755,
        source  => $lsbdistcodename ? {
            maverick    => "puppet:///files/lib/init/upstart-job.maverick",
            precise     => "puppet:///files/lib/init/upstart-job.precise",
        }
    }

    file { "/etc/dpkg/dpkg.cfg.d/multiarch":
        ensure  => absent,
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

    file { "/opt/root-anchor":
        owner   => root,
        group   => root,
        mode    => 0644,
        source  => "puppet:///files//opt/root-anchor",
    }
}

class etcfiles_ring {
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

    file { "/etc/ringfpingd.conf":
        content => template("ringfpingd.conf.erb");
    }
    service { "ringfpingd":
        ensure => running,
        subscribe => File["/etc/ringfpingd.conf"],
        hasrestart => true,
    }

    file { "/etc/network/if-up.d/syslog-ng":
        owner   => root,
        group   => root,
        mode    => 755,
        source  => "puppet:///files/etc/if-up.d/syslog-ng"
    }
}

class etcfiles_infra {
    file { "/etc/ssh/sshd_config":
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/etc/ssh/sshd_config.infra"
    } 
    
    service { ssh:
        ensure => running,
        subscribe => File["/etc/ssh/sshd_config"],
        hasrestart => true,
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
    file { "/usr/local/bin/puppet_zombiecleanup":
        owner   => root,
        group   => root,
        mode    => 0755,
        source  => "puppet:///files/usr/local/bin/puppet_zombiecleanup",
        ensure => present,
    }
        file { "/usr/local/bin/ring-fetch-nodes-json":
        owner   => root,
        group   => root,
        mode    => 0755,
        source  => "puppet:///files/usr/local/bin/ring-fetch-nodes-json",
        ensure => present,
    }
    file { "/usr/sbin/purgekernel":
        ensure  => absent,
    }
    file { "/usr/sbin/purgekernels":
        owner   => root,
        group   => root,
        mode    => 0755,
        source  => "puppet:///files/usr/sbin/purgekernels",
        ensure => present,
    }
    file { "/etc/apt/apt.conf.d/88pergekernels":
        ensure  => absent,
    }
    file { "/etc/apt/apt.conf.d/88purgekernels":
        owner   => root,
        group   => root,
        mode    => 0755,
        source  => "puppet:///files/etc/apt/apt.conf.d/88purgekernels",
        ensure => present,
    }
    file { "/etc/dhcp":
        ensure => directory,
        mode   => "755";
    }
    file { "/etc/dhcp/dhclient.conf":
        owner   => root,
        group   => root,
        mode    => 0644,
        source  => "puppet:///files/etc/dhcp/dhclient.conf",
        ensure => present,
    }
    file { "/etc/dhcp3":
        ensure => directory,
        mode   => "755";
    }
    file { "/etc/dhcp3/dhclient.conf":
        owner   => root,
        group   => root,
        mode    => 0644,
        source  => "puppet:///files/etc/dhcp/dhclient.conf",
        ensure => present,
    }

}

class local_binaries_pdnsmaster {
    file { "/usr/local/bin/ring-pdns":
        owner   => root,
        group   => root,
        mode    => 0755,
        source  => "puppet:///files/usr/local/bin/ring-pdns",
        ensure => present,
    }
}

class local_binaries_dbmaster {
    file { "/usr/local/bin/ring-admin":
        owner   => root,
        group   => root,
        mode    => 0755,
        source  => "puppet:///files/usr/local/bin/ring-admin",
        ensure => present,
    }
}
