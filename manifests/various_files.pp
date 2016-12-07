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

