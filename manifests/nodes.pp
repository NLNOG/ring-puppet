# nodes.pp
#
## Hosts

node basenode {
    #include users::virtual::ring_admins
    include cronjobs
    include puppet_pkgs
    include etcfiles
    include puppetbinaries
    include salt
}

node infranode inherits basenode {
    file { "/etc/puppet/puppet.conf":
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/etc/puppet/puppet.conf"
    }
}

node 'master01.infra' inherits basenode {
    include master_software
    include syslog_ng::server
    include mastercronjobs
    include trocla::config
    include usage_statistics
    include website
    Exec <<| tag == "destroy_virtual_machines" |>>
}

# container01 is hosted at XS4ALL
# 8 cores / 16GB RAM / 120GB disk
# virbr0 is bridged to eth0 (uplink)
# virbr1 is virtual switch on the box with this IP space:
#   IPv4 prefix: 82.94.230.128/28
#   IPv6 prefix: 2001:888:2001::/48
node 'container01.infra' inherits infranode {
    include containercronjobs
    include kvm
    
    kvm::virtual_machine { 'lg01':
        fqdn        => 'lg01.infra.ring.nlnog.net',
        ip          => '82.94.230.130', # ipv6 address is 2001:888:2001::130 
        netmask     => '255.255.255.240',
        dns         => '8.8.8.8',
        gateway     => '82.94.230.129',
        memory      => '4096',
        disksize    => '20',
        rootsize    => '19968',
        bridge      => 'virbr1',
        container   => "${hostname}",
        ensure      => present,
    }
    kvm::virtual_machine { 'xs4all01':
        fqdn        => 'xs4all01.ring.nlnog.net',
        ip          => '82.94.249.162', # ipv6 address is 2001:888:2000:3e::1337
        netmask     => '255.255.255.248',
        dns         => '8.8.8.8',
        gateway     => '82.94.249.161',
        memory      => '512',
        disksize    => '20',
        rootsize    => '19968',
        bridge      => 'virbr0',
        container   => "${hostname}",
        ensure      => present,
    }

    kvm::virtual_machine { 'staging01':
        fqdn        => 'staging01.ring.nlnog.net',
        ip          => '82.94.230.133', # ipv6 address is 2001:888:2001::133
        netmask     => '255.255.255.248',
        dns         => '8.8.8.8',
        gateway     => '82.94.230.129',
        memory      => '512',
        disksize    => '20',
        rootsize    => '19968',
        bridge      => 'virbr1',
        container   => "${hostname}",
        ensure      => present,
    }
}

# container02 is hosted at Leaseweb
# 8 cores / 32GB RAM / 120GB disk
# virbr0 is bridged to eth0 (uplink)
# virbr1 is virtual switch on the box with this IP space:
#   IPv4 prefix: 95.211.149.16 /28
#   IPv6 prefix: 2001:1AF8:4013::/48
node 'container02.infra' inherits infranode {
    include containercronjobs
    include kvm

    kvm::virtual_machine { 'public02':
        fqdn        => 'public02.infra.ring.nlnog.net',
        ip          => '95.211.149.18', # ipv6 address is 2001:1AF8:4013::18 
        netmask     => '255.255.255.240',
        dns         => '8.8.8.8',
        gateway     => '95.211.149.17',
        memory      => '1024',
        disksize    => '20',
        rootsize    => '19968',
        bridge      => 'virbr1',
        container   => "${hostname}",
        ensure      => present,
    }
    kvm::virtual_machine { 'auth':
        fqdn        => 'auth.infra.ring.nlnog.net',
        ip          => '95.211.149.22', # ipv6 address is 2001:1AF8:4013::22
        netmask     => '255.255.255.240',
        dns         => '8.8.8.8',
        gateway     => '95.211.149.17',
        memory      => '1024',
        disksize    => '20',
        rootsize    => '19968',
        bridge      => 'virbr1',
        container   => "${hostname}",
        ensure      => present,
    }
#    kvm::virtual_machine { 'master01.infra':
#        fqdn        => 'master01.infra.ring.nlnog.net',
#        ip          => '95.211.149.24', # ipv6 address is 2001:1AF8:4013::24
#        netmask     => '255.255.255.240',
#        dns         => '8.8.8.8',
#        gateway     => '95.211.149.17',
#        memory      => '1024',
#        disksize    => '20',
#        rootsize    => '109680',
#        bridge      => 'virbr1',
#        container   => "${hostname}",
#        ensure      => present,
#    }
}

# container03 is hosted at Atrato in Frankfurt
# 8 cores / 24GB RAM / 750GB disk
# virbr0 is bridged to eth0 (uplink)
# virbr1 is virtual switch on the box with this IP space:
#   IPv4 prefix: 78.152.42.64/28
#   IPv6 prefix: 2a02:d28:666:0:0:0:0:0/48
node 'container03.infra' inherits infranode {
    include containercronjobs
    include kvm

    kvm::virtual_machine { 'dbmaster':
        fqdn        => 'dbmaster.infra.ring.nlnog.net',
        ip          => '78.152.42.66', # ipv6 address is 2a02:d28:666::66
        netmask     => '255.255.255.240',
        dns         => '8.8.8.8',
        gateway     => '78.152.42.65',
        memory      => '1024',
        disksize    => '20',
        rootsize    => '19968',
        bridge      => 'virbr1',
        container   => "${hostname}",
        ensure      => present,
    }
    #kvm::virtual_machine { 'master01.infra':
    #    fqdn        => 'master01.infra.ring.nlnog.net',
    #    ip          => '78.152.42.69', # ipv6 address is 2a02:d28:666::69
    #    netmask     => '255.255.255.240',
    #    dns         => '8.8.8.8',
    #    gateway     => '78.152.42.65',
    #    memory      => '8192',
    #    disksize    => '40',
    #    rootsize    => '39936',
    #    bridge      => 'virbr1',
    #    container   => "${hostname}",
    #    ensure      => present,
    #}
}

# container04 is hosted at Bit in Ede
# died in october 2014

# container05 is hosted at Softlayer in Dallas 
# 12 cores / 32GB RAM / 1000GB RAID1
# virbr0 is bridged to eth0 (uplink)
# virbr1 is virtual switch on the box with this IP space:
#   IPv4 prefix: 108.168.252.128/28
#   IPv6 prefix: 16 x /64
#
# container05 is currently used as irrexplorer.nlnog.net
#node 'container05.infra' inherits infranode {
##    include containercronjobs
#    include syslog_ng::client
#    include kvm
#    include backup::client
#}

# container06 is hosted at PCExtreme in Amsterdam
# 8 cores / 32GB RAM / 2000GB RAID1 + SSD disks
# eth0 (uplink)
# virbr1 is virtual switch on the box with this IP space:
#   IPv4 prefix: 109.72.93.32/28
#   IPv6 prefix: 2a00:0f10:0122::/48
node 'container06.infra' inherits infranode {
    include containercronjobs
    include kvm
    
    kvm::virtual_machine { 'backup':
        fqdn        => 'backup.infra.ring.nlnog.net',
        ip          => '109.72.93.35', # ipv6 address is 2a00:0f10:0122::35
        netmask     => '255.255.255.240',
        dns         => '8.8.8.8',
        gateway     => '109.72.93.33',
        memory      => '8192',
        disksize    => '20',
        rootsize    => '19968',
        bridge      => 'virbr1',
        container   => "${hostname}",
        ensure      => present,
    }
}

# db boys

node dbslaves inherits infranode {
}

# we don't want apache running on regular ringnodes. smokeping installs 
# apache, so we just force it down here. 
class apache2 {
    package { "apache2-mpm-prefork": ensure => latest }
    package { "libapache2-mod-wsgi": ensure => latest }

    service { "apache2":
        alias => "apache",
        enable => true,
        ensure => running,
    }
    file { '/etc/apache2/sites-enabled/000-default':
        ensure => absent,
    }
}

class no-apache2 {
    service { "apache2":
        enable => false,
        ensure => stopped,
    }
}

