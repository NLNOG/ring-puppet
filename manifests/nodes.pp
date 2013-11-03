# nodes.pp
#
## Hosts

node basenode {
    include users::virtual::ring_admins
    include cronjobs
    include groups
    include nettools
    include etcfiles
    include local_binaries
    include munin::client
    include nlnogrepokey
    include lang
    munin::plugin { ["users", "tcp", "ntp_offset", "uptime", "threads", "ntp_kernel_pll_off", "diskstats", "proc_pri", "iostat_ios"]:
    }
    include ssh
    include timezone
    include fail2ban-whitelist
    $postfix_smtp_listen = "127.0.0.1"
    $root_mail_recipient = "ring-admins@ring.nlnog.net"
    $postfix_myorigin = ""
    include postfix
    include resolving
    class { 'apt': }
    include ring::apt
}

node ringnode inherits basenode {
    include users::virtual::ring_users
#    include no-apache2
    include syslog_ng::client
    include nodesonlycron
    include etcfiles_ring
    package { "munin": ensure => purged, }
    file { "/etc/puppet/puppet.conf":
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/etc/puppet/puppet.conf"
    }

}

node infranode inherits basenode {
    include etcfiles_infra
    file { "/etc/puppet/puppet.conf":
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/etc/puppet/puppet.conf"
    }
}

node 'master01.infra' inherits basenode {
    include etcfiles_infra
    include users
    include master_software
    include syslog_ng::server
    include apache2
    include mastercronjobs
    include trocla::config
    include usage_statistics
    include website
    include nagios::defaults
    include nagios::headless
    include nagios_services
    nagios::service::http { $name:
        check_domain => "${name}"
    }
    include nagios::target::fqdn
    nagios::service::dnssec::trace { '${name}_a': domain  => 'nlnog.net'; }
    nagios::service::dnssec::trace { '${name}_b': domain  => 'ring.nlnog.net'; }
    nagios::service::dnssec::trace { '${name}_c': domain  => 'nlring.net'; }
    nagios::service::dnssec::exp { 
        '${name}_1':
            domain  => 'nlnog.net',
            dns_ip  => '2001:7b8:3:2c::53', dnsserver   => 'nsauth1.bit.nl-v6';
        '${name}_2':
            domain  => 'nlnog.net',
            dns_ip  => '194.109.9.100', dnsserver   => 'ns2.xs4all.nl-v4';
        '${name}_3':
            domain  => 'nlnog.net',
            dns_ip  => '2001:67c:1a8:100::4', dnsserver   => 'nemix2.ams-ix.net-v6';
        '${name}_4':
            domain  => 'ring.nlnog.net',
            dns_ip  => '94.142.241.53', dnsserver   => 'ns1.6core.net';
        '${name}_5':
            domain  => 'ring.nlnog.net',
            dns_ip  => '82.94.230.131', dnsserver   => 'ns01.infra.ring.nlnog.net';
        '${name}_6':
            domain  => 'ring.nlnog.net',
            dns_ip  => '79.170.90.163', dnsserver   => 'ns.rodecker.nl';
        '${name}_7':
            domain  => 'ring.nlnog.net',
            dns_ip  => '83.247.10.51', dnsserver   => 'a.ns.meerval.net';

    }
    munin::plugin { ["apache_accesses", "apache_processes", "apache_volume"]:
    }
    Exec <<| tag == "destroy_virtual_machines" |>>
    include backup::client
}

# container01 is hosted at XS4ALL
# 8 cores / 16GB RAM / 120GB disk
# virbr0 is bridged to eth0 (uplink)
# virbr1 is virtual switch on the box with this IP space:
#   IPv4 prefix: 82.94.230.128/28
#   IPv6 prefix: 2001:888:2001::/48
node 'container01.infra' inherits infranode {
    include users
    include syslog_ng::client
    include nagios_services
    include nagios::target::fqdn
    include kvm
    include backup::client
    munin::plugin { ["libvirt", "apache_accesses", "apache_processes", "apache_volume"]:
    }
    
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
    kvm::virtual_machine { 'public01':
        fqdn        => 'public01.infra.ring.nlnog.net',
        ip          => '82.94.230.131', # ipv6 address is 2001:888:2001::131
        netmask     => '255.255.255.240',
        dns         => '8.8.8.8',
        gateway     => '82.94.230.129',
        memory      => '1024',
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

    kvm::virtual_machine { 'mailman.infra':
        fqdn        => 'mailman.infra.ring.nlnog.net',
        ip          => '82.94.230.132', # ipv6 address is 2001:888:2001::132
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

    kvm::virtual_machine { 'db01':
        fqdn        => 'db01.infra.ring.nlnog.net',
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
# 8 cores / 16GB RAM / 120GB disk
# virbr0 is bridged to eth0 (uplink)
# virbr1 is virtual switch on the box with this IP space:
#   IPv4 prefix: 95.211.149.16 /28
#   IPv6 prefix: 2001:1AF8:4013::/48
node 'container02.infra' inherits infranode {
    include users
    include syslog_ng::client
    include nagios_services
    include nagios::target::fqdn
    include kvm
    include backup::client
    munin::plugin { ["libvirt", "apache_accesses", "apache_processes", "apache_volume"]:
    }

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
    kvm::virtual_machine { 'db02':
        fqdn        => 'db02.infra.ring.nlnog.net',
        ip          => '95.211.149.19', # ipv6 address is 2001:1AF8:4013::19
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


}

# container03 is hosted at Atrato in Frankfurt
# 8 cores / 24GB RAM / 750GB disk
# virbr0 is bridged to eth0 (uplink)
# virbr1 is virtual switch on the box with this IP space:
#   IPv4 prefix: 78.152.42.64/28
#   IPv6 prefix: 2a02:d28:666:0:0:0:0:0/48
node 'container03.infra' inherits infranode {
    include users
    include syslog_ng::client
    include nagios_services
    include nagios::target::fqdn
    include kvm
    include backup::client
    munin::plugin { ["libvirt", "apache_accesses", "apache_processes", "apache_volume"]:
    }

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
    kvm::virtual_machine { 'db03':
        fqdn        => 'db03.infra.ring.nlnog.net',
        ip          => '78.152.42.67', # ipv6 address is 2a02:d28:666::67
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
    kvm::virtual_machine { 'bgpmon':
        fqdn        => 'bgpmon.infra.ring.nlnog.net',
        ip          => '78.152.42.68', # ipv6 address is 2a02:d28:666::68
        netmask     => '255.255.255.240',
        dns         => '8.8.8.8',
        gateway     => '78.152.42.65',
        memory      => '2048',
        disksize    => '20',
        rootsize    => '19968',
        bridge      => 'virbr1',
        container   => "${hostname}",
        ensure      => present,
    }
    kvm::virtual_machine { 'master01.infra':
        fqdn        => 'master01.infra.ring.nlnog.net',
        ip          => '78.152.42.69', # ipv6 address is 2a02:d28:666::69
        netmask     => '255.255.255.240',
        dns         => '8.8.8.8',
        gateway     => '78.152.42.65',
        memory      => '8192',
        disksize    => '40',
        rootsize    => '39936',
        bridge      => 'virbr1',
        container   => "${hostname}",
        ensure      => present,
    }
    kvm::virtual_machine { 'atrato03':
        fqdn        => 'atrato03.ring.nlnog.net',
        ip          => '78.152.42.70', # ipv6 address is 2a02:d28:666::70
        netmask     => '255.255.255.240',
        dns         => '8.8.8.8',
        gateway     => '78.152.42.65',
        memory      => '512',
        disksize    => '20',
        rootsize    => '19968',
        bridge      => 'virbr1',
        container   => "${hostname}",
        ensure      => present,
    }


}

# container04 is hosted at Bit in Ede
# 8 cores / 16GB RAM / 146GB disk
# virbr0 is bridged to eth0 (uplink)
# virbr1 is virtual switch on the box with this IP space:
#   IPv4 prefix: 213.154.249.160/28
#   IPv6 prefix: 2001:7b8:d05::/48

node 'container04.infra' inherits infranode {
    include users
    include syslog_ng::client
    include nagios_services
    include nagios::target::fqdn
    include kvm
    include backup::client
    munin::plugin { ["libvirt", "apache_accesses", "apache_processes", "apache_volume"]:
    }
    kvm::virtual_machine { 'db04':
        fqdn        => 'db04.infra.ring.nlnog.net',
        ip          => '213.154.249.162', # ipv6 address is 2001:7b8:d05::162
        netmask     => '255.255.255.240',
        dns         => '8.8.8.8',
        gateway     => '213.154.249.161',
        memory      => '1024',
        disksize    => '20',
        rootsize    => '19968',
        bridge      => 'virbr1',
        container   => "${hostname}",
        ensure      => present,
    }
    kvm::virtual_machine { 'bit01':
        fqdn        => 'bit01.ring.nlnog.net',
        ip          => '213.154.249.163', # ipv6 address is 2001:7b8:d05::163
        netmask     => '255.255.255.240',
        dns         => '8.8.8.8',
        gateway     => '213.154.249.161',
        memory      => '512',
        disksize    => '20',
        rootsize    => '19968',
        bridge      => 'virbr1',
        container   => "${hostname}",
        ensure      => present,
    }
    kvm::virtual_machine { 'staging01':
        fqdn        => 'staging01.ring.nlnog.net',
        ip          => '213.154.249.164', # ipv6 address is 2001:7b8:d05::164
        netmask     => '255.255.255.240',
        dns         => '8.8.8.8',
        gateway     => '213.154.249.161',
        memory      => '512',
        disksize    => '10',
        rootsize    => '9984',
        bridge      => 'virbr1',
        container   => "${hostname}",
        ensure      => present,
    }


}

# container05 is hosted at Softlayer in Dallas 
# 12 cores / 32GB RAM / 1000GB RAID1
# virbr0 is bridged to eth0 (uplink)
# virbr1 is virtual switch on the box with this IP space:
#   IPv4 prefix: 108.168.252.128/28
#   IPv6 prefix: 16 x /64
node 'container05.infra' inherits infranode {
    include users
    include syslog_ng::client
    include nagios_services
    include nagios::target::fqdn
    include kvm
    include backup::client
    munin::plugin { ["libvirt", "apache_accesses", "apache_processes", "apache_volume"]:
    }
    $nagios_ping_rate = '!180.0,20%!300.0,60%'
    include backup::client
    
    kvm::virtual_machine { 'db05':
        fqdn        => 'db05.infra.ring.nlnog.net',
        ip          => '108.168.252.130', # ipv6 address is 2607:f0d0:1103:f0::130
        netmask     => '255.255.255.240',
        dns         => '8.8.8.8',
        gateway     => '108.168.252.129',
        memory      => '1024',
        disksize    => '20',
        rootsize    => '19968',
        bridge      => 'virbr1',
        container   => "${hostname}",
        ensure      => present,
    }
    kvm::virtual_machine { 'us':
        fqdn        => 'us01.irr.infra.ring.nlnog.net',
        ip          => '108.168.252.131', # ipv6 address is 2607:f0d0:1103:f0::131
        netmask     => '255.255.255.240',
        dns         => '8.8.8.8',
        gateway     => '108.168.252.129',
        memory      => '5120',
        disksize    => '20',
        rootsize    => '19968',
        bridge      => 'virbr1',
        container   => "${hostname}",
        ensure      => present,
    }
}

node 'bgpmon.infra' inherits infranode {
    $owner = "job"
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include syslog_ng::client
    include nodesonlycron
    include users
    add_user { 'dave':                                                                                                                                                                                                 
        email    => 'dave@claranet',
        company => 'Claranet',
        uid      => 5124,
        groups  => ['ring-users', 'admin'],
    }
    authorized_keys { 'dave':
        sshkeys => ['ssh-dss AAAAB3NzaC1kc3MAAACBANA+2Nq9N9IQfPqgmHhdYl932sxJb45PB/UgE/ATxOiP5Ev9sz6Vi+85WrD3kwYvszbRmdm6nIR6a5O861K8B+DKsYoWuE1tFxWgSszlbYzuTMXfPg+zI2IAen/YtzgsATnJPIKUub5bO18O3qGX5f/Xf21kJUsGdDx/F13Bb1UlAAAAFQC8JQHI/PW8wmZwmJKoLDHjb9W1XQAAAIEAq7/xIeDcg4FYiZeUl7VZxrB7HhMwBePOuBgpVyghYsJIM1wyWULN99aMxVQphZa77Y0I6UeaXoQu4Mt52O7Q8oq8FtxfCxUguFh0O+5qKZ66PjNmu/BC5s/GioxnoZ2baT/ka0xV3pQ01wZknk1Eb0ze750OdDs143Tq9eos2IkAAACBAJxziC4dxXJ6mOKYHdnEWRC57UFYxLwk5fKMemP0xJZk2/2Wahq+2pNoCWZvnUk6jWHMVhIV8BG7Bq37B1Qq/XuiEfkc+E1gCEYjwIhvvKYsR+SMeejCv1Bv7HV39ZPoGUjdYyQgciBrDCG13R1QShWNRcTK5liOTbyCcxI2QzTK david.freedman@uk.clara.net(RING)'],
    }
    include backup::client
}

node 'us01.irr.infra' inherits infranode {
    $owner = "job"
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include syslog_ng::client
    include nodesonlycron
    include users
    include backup::client
    $nagios_ping_rate = '!180.0,20%!300.0,60%'
}


# container06 is hosted at PCExtreme in Amsterdam
# 8 cores / 32GB RAM / 2000GB RAID1 + SSD disks
# eth0 (uplink)
# virbr1 is virtual switch on the box with this IP space:
#   IPv4 prefix: 109.72.93.32/28
#   IPv6 prefix: 2a00:0f10:0122::/48
node 'container06.infra' inherits infranode {
    include users
    include syslog_ng::client
    include nagios_services
    include nagios::target::fqdn
    include kvm
    munin::plugin { ["libvirt", "apache_accesses", "apache_processes", "apache_volume"]:
    }
    
    kvm::virtual_machine { 'db06':
        fqdn        => 'db06.infra.ring.nlnog.net',
        ip          => '109.72.93.34', # ipv6 address is 2a00:0f10:0122::34
        netmask     => '255.255.255.240',
        dns         => '8.8.8.8',
        gateway     => '109.72.93.33',
        memory      => '1024',
        disksize    => '20',
        rootsize    => '19968',
        bridge      => 'virbr1',
        container   => "${hostname}",
        ensure      => present,
    }

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

node 'dbmaster.infra' inherits infranode {
    $owner = "job"
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include syslog_ng::client
    include nodesonlycron
    include users
#    class { "mysql::server": 
#        config_hash => {
#            'root_password' => trocla("mysql_${fqdn}",'plain'),
#            'server-id'     => '666',
#        }
#    }
    include local_binaries_dbmaster
    include backup::client
}

node 'db01.infra' inherits dbslaves {
    $owner = "job"
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include syslog_ng::client
    include nodesonlycron
    include users
    include mysql::server
}

node 'db02.infra' inherits dbslaves {
    $owner = "job"
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include syslog_ng::client
    include nodesonlycron
    include users
    include mysql::server 
}

node 'db03.infra' inherits dbslaves {
    $owner = "job"
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include syslog_ng::client
    include nodesonlycron
    include users
    include mysql::server
}
node 'db04.infra' inherits dbslaves {
    $owner = "job"
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include syslog_ng::client
    include nodesonlycron
    include users
    include mysql::server
}

node 'db05.infra' inherits dbslaves {
    $owner = "job"
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include syslog_ng::client
    include nodesonlycron
    include users
    $nagios_ping_rate = '!180.0,20%!300.0,60%'
    include mysql::server
}

node 'db06.infra' inherits dbslaves {
    $owner = "job"
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include syslog_ng::client
    include nodesonlycron
    include users
    include mysql::server
}


# website, dns, mailing-list etc
node 'public01.infra' inherits infranode {
    $owner = "job"
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include syslog_ng::client
    include nodesonlycron
    include users
    include apache2
    include munin::host
    munin::plugin { ["apache_accesses", "apache_processes", "apache_volume"]:
    }
    nagios::service::http { $name:
        check_domain => "${name}"
    }
    include powerdns
# FIXME
# we moved to new puppet mysql module, but I can't predict what happens
# if we just use it here, especially with passwords. 
#    class { 'mysql::server':
#        config_hash => {
#            'root_password' => trocla("mysql_${fqdn}",'plain'),
#        }
#    }
    include local_binaries_pdnsmaster
    include pdnscronjobs
    include backup::client
}

node 'public02.infra' inherits infranode {
    $owner = "job"
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include syslog_ng::client
    include nodesonlycron
    include users
    include apache2
    munin::plugin { ["apache_accesses", "apache_processes", "apache_volume"]:
    }
    nagios::service::http { $name:
        check_domain => "${name}"
    }
    include powerdns
    include backup::client
}

node 'backup.infra' inherits infranode {
    $owner = "job"
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include syslog_ng::client
    include nodesonlycron
    include users
    include backup::server
}


# looking glass 1
node 'lg01.infra' inherits infranode {
    $owner = "job"
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users::virtual::ring_users
    include syslog_ng::client
    include nodesonlycron
    include users
    include backup::client
# FIXME
# bird is nu distributed over meerdere processen
# met een smerige iptables hack. Ik moet de puppet
# manifesten nog aanpassen dat de nieuwe setup werkt
#    include bird
#    include bird-lg-proxy 
    munin::plugin { ["bird", "bird6"]:
    }
    add_user { 'dave':                                                                                                                                                                                                 
        email    => 'dave@claranet',
        company => 'Claranet',
        uid      => 6124,
        groups  => ['ring-users', 'admin'],
    }
    authorized_keys { 'dave':
        sshkeys => ['ssh-dss AAAAB3NzaC1kc3MAAACBANA+2Nq9N9IQfPqgmHhdYl932sxJb45PB/UgE/ATxOiP5Ev9sz6Vi+85WrD3kwYvszbRmdm6nIR6a5O861K8B+DKsYoWuE1tFxWgSszlbYzuTMXfPg+zI2IAen/YtzgsATnJPIKUub5bO18O3qGX5f/Xf21kJUsGdDx/F13Bb1UlAAAAFQC8JQHI/PW8wmZwmJKoLDHjb9W1XQAAAIEAq7/xIeDcg4FYiZeUl7VZxrB7HhMwBePOuBgpVyghYsJIM1wyWULN99aMxVQphZa77Y0I6UeaXoQu4Mt52O7Q8oq8FtxfCxUguFh0O+5qKZ66PjNmu/BC5s/GioxnoZ2baT/ka0xV3pQ01wZknk1Eb0ze750OdDs143Tq9eos2IkAAACBAJxziC4dxXJ6mOKYHdnEWRC57UFYxLwk5fKMemP0xJZk2/2Wahq+2pNoCWZvnUk6jWHMVhIV8BG7Bq37B1Qq/XuiEfkc+E1gCEYjwIhvvKYsR+SMeejCv1Bv7HV39ZPoGUjdYyQgciBrDCG13R1QShWNRcTK5liOTbyCcxI2QzTK david.freedman@uk.clara.net(RING)'],
    }

}

node 'worker01' inherits infranode {
    $nagios_ping_rate = '!180.0,20%!300.0,60%'
    include users
    include backup::client
    include syslog_ng::client
    include apache2
    include nagios_services
    include nagios::target::fqdn

   nagios::service::http { $name:
        check_domain => "${name}"
    }
    munin::plugin { ["apache_accesses", "apache_processes", "apache_volume"]:
    }
}

node 'worker02' inherits infranode {
    $nagios_ping_rate = '!180.0,20%!300.0,60%'
    include backup::client
    include users
    include syslog_ng::client
    include apache2
    include nagios_services
    include nagios::target::fqdn
#    nagios::service::http { $name:
#        check_domain => "${name}"
#    }
    munin::plugin { ["apache_accesses", "apache_processes", "apache_volume"]:
    }
}

node 'worker03' inherits infranode {
    $nagios_ping_rate = '!180.0,20%!300.0,60%'
    include users
    include backup::client
    include syslog_ng::client
    include apache2
    include nagios_services
    include nagios::target::fqdn
    nagios::service::http { $name:
        check_domain => "${name}"
    }
    munin::plugin { ["apache_accesses", "apache_processes", "apache_volume"]:
    }

# give Brendon access for AMP
##### BEGIN brendon-wand #####

    add_user { 'brendon-wand':
        email => 'brendonj@cs.waikato.ac.nz',
        company => 'Brendon Jones',
        uid => '5110',
        groups => ['ring-users', 'ring-admins'],
    }
    authorized_keys { 'brendon-wand':
        sshkeys => [
           'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDESb7w1mFquFHO1isMqwBABo+PRhKBtewCYnnKsRLWSlC0EYonnpRWGhZv29P7vgVpv79aUuf8XUtSYx2knMXFlFWZhj5/e71Yhn15Fg7E7Ib2N9kwd0Gizg5KXTSoMR7HUMpDPFXbZY7MkpNZQtC3iyQzptp8q/VlszbFtUvMMK2jlrMRkULR8PCV28WHZnBeIB8+XXgzUwOPrG4sgaZqiiEXnC/eVv8bPPZApwIvv6Ac1ekqMq7HNQaccgYff0c1s6EPZzlMV2vLhvKi3E4NMpFXNRIhvM2Px2QsrnvmV+NMIDB3O5zQkV+Lv1kFoWT1NRb6AfQ0KtDF3zjkiVbX brendonj@voodoo',
        ],
    }
##### END brendon-wand #####

}

# we don't want apache running on regular ringnodes. smokeping installs 
# apache, so we just force it down here. 
class apache2 {
    service { "apache2":
        alias => "apache",
        enable => true,
        ensure => running,
    }
}

class no-apache2 {
    service { "apache2":
        enable => false,
        ensure => stopped,
    }
}

## define all groups

class groups {
    add_group { ring-users:
        gid => 5000
    }
    add_group { admin:
        gid => 99
    }
    add_group { ring-admins:
        gid => 6000 
    }
}

### provide class to realise users

class users {
    Add_user <| groups == "ring-admins" or groups == "ring-users" |>
}

#### staging #####

node 'staging01' inherits ringnode {
    $owner = "job"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'staging02' inherits ringnode {
    $owner = "previder"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

#### einde staging #####

#### define all ring nodes ####

node 'intouch01' inherits ringnode {
    $owner = "intouch"
    $location = "52.355930,4.951873"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'bit01' inherits ringnode {
    $owner = "bit"
    $location = "52.027596,5.624528"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'coloclue01' inherits ringnode {
    $owner = "coloclue"
    $location = "52.332901,4.919525"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'widexs01' inherits ringnode {
    $owner = "widexs"
    $location = "52.399982,4.842305"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'xlshosting01' inherits ringnode {
    $owner = "xlshosting"
    $location = "52.332912,4.919461"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'interconnect01' inherits ringnode {
    $owner = "interconnect"
    $location = "51.686672,5.359043"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'cambrium01' inherits ringnode {
    $owner = "cambrium"
    $location = "52.340988,5.227518"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'cyso01' inherits ringnode {
    $owner = "cyso"
    $location = "52.343983,4.828710"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'zylon01' inherits ringnode {
    $owner = "zylon"
    $location = "52.396420,4.851092"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'duocast01' inherits ringnode {
    $owner = "duocast"
    $location = "53.246086,6.528518"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'easyhosting01' inherits ringnode {
    $owner = "easyhosting"
    $location = "52.391132,4.665263"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'previder01' inherits ringnode {
    $owner = "previder"
    $location = "52.243954,6.767229"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'leaseweb01' inherits ringnode {
    $owner = "leaseweb"
    $location = "52.391224,4.665155"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'nxs01' inherits ringnode {
    $owner = "nxs"
    $location = "52.393200,4.847546"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'xs4all01' inherits ringnode {
    $owner = "xs4all"
    $location = "52.336353,4.886652"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'nedzone01' inherits ringnode {
    $owner = "nedzone"
    $location = "51.587601,4.305047"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'oxilion01' inherits ringnode {
    $owner = "oxilion"
    $location = "52.243969,6.767278"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'ebayclassifiedsgroup01' inherits ringnode {
    $owner = "ebayclassifiedsgroup"
    $location = "52.280964,4.754237"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'is01' inherits ringnode {
    $owner = "is"
    $location = "52.396759,4.838742"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'surfnet01' inherits ringnode {
    $owner = "surfnet"
    $location = "52.090767,5.112371"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'prolocation01' inherits ringnode {
    $owner = "prolocation"
    $location = "52.343983,4.828710"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'in2ip01' inherits ringnode {
    $owner = "in2ip"
    $location = "52.395855,4.841133"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'netground01' inherits ringnode {
    $owner = "netground"
    $location = "52.343983,4.828710"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'totaalnet01' inherits ringnode {
    $owner = "totaalnet"
    $location = "51.987831,5.933394"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'signet01' inherits ringnode {
    $owner = "signet"
    $location = "51.501537,5.460406"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'tripleit01' inherits ringnode {
    $owner = "tripleit"
    $location = "52.303066,4.937898"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'jaguarnetwork01' inherits ringnode {
    $owner = "jaguarnetwork"
    $location = "43.310226,5.373356"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'tuxis01' inherits ringnode {
    $owner = "tuxis"
    $location = "52.027649,5.624506"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'tenet01' inherits ringnode {
    $owner = "tenet"
    $location = "-26.204103,28.047304"
    $nagios_ping_rate = '!300.0,20%!500.0,60%'
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'bigwells01' inherits ringnode {
    $owner = "bigwells"
    $location = "41.892365,-87.634918"
    $nagios_ping_rate = '!250.0,20%!500.0,60%'
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'tdc01' inherits ringnode {
    $owner = "tdc"
    $location = "60.221024,24.848589"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'netability01' inherits ringnode {
    $owner = "netability"
    $location = "53.405754,-6.372293"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'unilogicnetworks01' inherits ringnode {
    $owner = "unilogicnetworks"
    $location = "50.996090,5.845644"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'maverick01' inherits ringnode {
    $owner = "maverick"
    $location = "52.393036,16.947895"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'acsystemy01' inherits ringnode {
    $owner = "acsystemy"
    $location = "53.910034,14.247578"
    $nagios_ping_rate = '!180.0,20%!300.0,60%'
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'netsign01' inherits ringnode {
    $owner = "netsign"
    $location = "52.465530,13.368666"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
    $nagios_ping_rate = '!150.0,20%!250.0,60%'
}

node 'rrbone01' inherits ringnode {
    $owner = "rrbone"
    $location = "51.188271,6.867769"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'hosteam01' inherits ringnode {
    $owner = "hosteam"
    $location = "52.227661,21.004250"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'msp01' inherits ringnode {
    $owner = "msp"
    $location = "51.525089,-0.072224"
    include amp_client
    munin::plugin { ["sensors_volt", "sensors_temp", "sensors_fan"]:
        ensure => "sensors_" 
    }
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'inotel01' inherits ringnode {
    $owner = "inotel"
    $location = "52.391102,16.897284"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'fremaks01' inherits ringnode {
    $owner = "fremaks"
    $location = "53.077320,8.772950"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'blix01' inherits ringnode {
    $owner = "blix"
    $location = "59.924725,10.810183"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'portlane01' inherits ringnode {
    $owner = "portlane"
    $location = "59.306946,18.130274"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'solido01' inherits ringnode {
    $owner = "solido"
    $location = "55.728542,12.376454"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'solido02' inherits ringnode {
    $owner = "solido"
    $location = "49.50481,6.11237"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'digmia01' inherits ringnode {
    $owner = "digmia"
    $location = "48.119209,17.095844"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'rootlu01' inherits ringnode {
    $owner = "rootlu"
    $location = "49.671227,6.125205"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
    $nagios_ping_rate = '!300.0,20%!400.0,60%'
}

node 'globalaxs01' inherits ringnode {
    $owner = "globalaxs"
    $location = "53.461365,-2.324666"
    $nagios_ping_rate = '!200.0,20%!400.0,60%'
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'nebula01' inherits ringnode {
    $owner = "nebula"
    $location = "60.218018,24.879240"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'tilaa01' inherits ringnode {
    $owner = "tilaa"
    $location = "52.391090,4.665314"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'nautile01' inherits ringnode {
    $owner = "nautile"
    $location = "-22.267935,166.462219"
    $nagios_ping_rate = '!450.0,20%!700.0,60%'
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'voxel01' inherits ringnode {
    $owner = "voxel"
    $location = "37.241619,-121.783218"
    $nagios_ping_rate = '!250.0,20%!500.0,60%'
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'voxel02' inherits ringnode {
    $owner = "voxel"
    $location = "1.295461,103.789787"
    $nagios_ping_rate = '!550.0,20%!900.0,60%'
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'neotelecoms01' inherits ringnode {
    $owner = "neotelecoms"
    $location = "48.899693,2.296256"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'apnic01' inherits ringnode {
    $owner = "apnic"
    $location = "-27.458248,153.031067"
    $nagios_ping_rate = '!500.0,20%!800.0,60%'
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'atrato02' inherits ringnode {
    $owner = "atrato"
    $location = "40.717884,-74.008938"
    $nagios_ping_rate = '!200.0,20%!400.0,60%'
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'atrato03' inherits ringnode {
    $owner = "atrato"
    $location = "50.11092,8.68213"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'man-da01' inherits ringnode {
    $owner = "man-da"
    $location = "49.86170,8.68210"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'webair01' inherits ringnode {
    $owner = "webair"
    $location = "40.722529,-73.632961"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'concepts-ict01' inherits ringnode {
    $owner = "concepts-ict"
    $location = "51.592992,4.802703"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'dataoppdrag01' inherits ringnode {
    $owner = "dataoppdrag"
    $location = "60.295349,5.255753"
    $nagios_ping_rate = '!250.0,20%!400.0,60%'
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'tetaneutral01' inherits ringnode {
    $owner = "tetaneutral"
    $location = "43.61847,1.42075"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'jump01' inherits ringnode {
    $owner = "jump"
    $location = "51.5120776,-0.0020345"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'iway01' inherits ringnode {
    $owner = "iway"
    $location = "47.387639,8.519944"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'timico01' inherits ringnode {
    $owner = "timico"
    $location = "53.07897,-0.792212"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'rezopole01' inherits ringnode {
    $owner = "rezopole"
    $location = "45.72289,4.861422"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'solnet01' inherits ringnode {
    $owner = "solnet"
    $location = "47.20182,7.52878"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'boxed-it01' inherits ringnode {
    $owner = "boxed-it"
    $location = "50.881431,4.454129"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'spacenet01' inherits ringnode {
    $owner = "spacenet"
    $location = "48.133333,11.566667"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'mironet01' inherits ringnode {
    $owner = "mironet"
    $location = "47.5143,7.616726"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'seeweb01' inherits ringnode {
    $owner = "seeweb"
    $location = "45.478696,9.105091"
    $nagios_ping_rate = '!180.0,20%!300.0,60%'
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'zensystems01' inherits ringnode {
    $owner = "zensystems"
    $location = "55.7284634,12.376985"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'westnet01' inherits ringnode {
    $owner = "westnet"
    $location = "53.858024,-9.279904"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'kantonsschulezug01' inherits ringnode {
    $owner = "kantonsschulezug"
    $location = "47.1744,8.5233"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'filoo01' inherits ringnode {
    $owner = "filoo"
    $location = "50.09676,8.628393"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'nessus01' inherits ringnode {
    $owner = "nessus"
    $location = "48.179737,16.364007"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'amazon01' inherits ringnode {
    $owner = "amazon"
    $location = "38.944444,-77.455833"
    include amp_client
    include nagios::target::fqdn
    $nagios_ping_rate = '!200.0,20%!300.0,60%'
    include nagios_services
    include set_local_settings
	include users

    # hopefully a temp fix because of:
    # https://bugs.launchpad.net/ubuntu/+source/linux/+bug/613273
    file { "/usr/share/initramfs-tools/scripts/init-bottom/udev":
        ensure  => present,
        mode    => 0755,
        owner   => root,
        group   => root,
        source  => "puppet:///files/usr/share/initramfs-tools/scripts/init-bottom/udev",
    }
}

node 'amazon02' inherits ringnode {
    $owner = "amazon"
    $location = "53.43333,-6.25000"
    $nagios_ping_rate = '!180.0,20%!300.0,60%'
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users

    # hopefully a temp fix because of:
    # https://bugs.launchpad.net/ubuntu/+source/linux/+bug/613273
    file { "/usr/share/initramfs-tools/scripts/init-bottom/udev":
        ensure  => present,
        mode    => 0755,
        owner   => root,
        group   => root,
        source  => "puppet:///files/usr/share/initramfs-tools/scripts/init-bottom/udev",
    }
}


node 'amazon03' inherits ringnode {
    $owner = "amazon"
    $location = "1.358816,103.9891"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    $nagios_ping_rate = '!550.0,20%!900.0,60%'
    include set_local_settings
	include users

    # hopefully a temp fix because of:
    # https://bugs.launchpad.net/ubuntu/+source/linux/+bug/613273
    file { "/usr/share/initramfs-tools/scripts/init-bottom/udev":
        ensure  => present,
        mode    => 0755,
        owner   => root,
        group   => root,
        source  => "puppet:///files/usr/share/initramfs-tools/scripts/init-bottom/udev",
    }
}

node 'amazon04' inherits ringnode {
    $owner = "amazon"
    $location = "35.765278,140.385556"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    $nagios_ping_rate = '!550.0,20%!900.0,60%'
    include set_local_settings
	include users

    # hopefully a temp fix because of:
    # https://bugs.launchpad.net/ubuntu/+source/linux/+bug/613273
    file { "/usr/share/initramfs-tools/scripts/init-bottom/udev":
        ensure  => present,
        mode    => 0755,
        owner   => root,
        group   => root,
        source  => "puppet:///files/usr/share/initramfs-tools/scripts/init-bottom/udev",
    }
}

node 'amazon05' inherits ringnode {
    $owner = "amazon"
    $location = "45.588611,-122.5975"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    $nagios_ping_rate = '!300.0,20%!500.0,60%'
    include set_local_settings
	include users

    # hopefully a temp fix because of:
    # https://bugs.launchpad.net/ubuntu/+source/linux/+bug/613273
    file { "/usr/share/initramfs-tools/scripts/init-bottom/udev":
        ensure  => present,
        mode    => 0755,
        owner   => root,
        group   => root,
        source  => "puppet:///files/usr/share/initramfs-tools/scripts/init-bottom/udev",
    }
}

node 'amazon06' inherits ringnode {
    $owner = "amazon"
    $location = "37.618889,-122.375"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    $nagios_ping_rate = '!300.0,20%!500.0,60%'
    include set_local_settings
	include users

    # hopefully a temp fix because of:
    # https://bugs.launchpad.net/ubuntu/+source/linux/+bug/613273
    file { "/usr/share/initramfs-tools/scripts/init-bottom/udev":
        ensure  => present,
        mode    => 0755,
        owner   => root,
        group   => root,
        source  => "puppet:///files/usr/share/initramfs-tools/scripts/init-bottom/udev",
    }
}

node 'amazon07' inherits ringnode {
    $owner = "amazon"
    $location = "-23.54894,-46.63882"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    $nagios_ping_rate = '!300.0,20%!500.0,60%'
    include set_local_settings
	include users

    # hopefully a temp fix because of:
    # https://bugs.launchpad.net/ubuntu/+source/linux/+bug/613273
    file { "/usr/share/initramfs-tools/scripts/init-bottom/udev":
        ensure  => present,
        mode    => 0755,
        owner   => root,
        group   => root,
        source  => "puppet:///files/usr/share/initramfs-tools/scripts/init-bottom/udev",
    }
}

node 'amazon08' inherits ringnode {
    $owner = "amazon"
    $location = "-33.86749,151.20699"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    $nagios_ping_rate = '!300.0,20%!500.0,60%'
    include set_local_settings
	include users

    # hopefully a temp fix because of:
    # https://bugs.launchpad.net/ubuntu/+source/linux/+bug/613273
    file { "/usr/share/initramfs-tools/scripts/init-bottom/udev":
        ensure  => present,
        mode    => 0755,
        owner   => root,
        group   => root,
        source  => "puppet:///files/usr/share/initramfs-tools/scripts/init-bottom/udev",
    }
}



node 'equinixnl01' inherits ringnode {
    $owner = "equinixnl"
    $location = "52.2373,6.8496"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'lchost01' inherits ringnode {
    $owner = "lchost"
    $location = "51.496716,-0.017987"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'hostway01' inherits ringnode {
    $owner = "hostway"
    $location = "49.288462,-123.118197"
    $nagios_ping_rate = '!300.0,20%!500.0,60%'
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'pcextreme01' inherits ringnode {
    $owner = "pcextreme"
    $location = "52.400483,4.842865"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'antagonist01' inherits ringnode {
    $owner = "antagonist"
    $location = "52.244396,6.767321"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'nts01' inherits ringnode {
    $owner = "nts"
    $location = "46.936647,7.429907"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
	include users
}

node 'multiplay01' inherits ringnode {
    $owner = "multiplay"
    $location = "51.520493,-0.073546"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'softlayer01' inherits ringnode {
    $owner = "softlayer"
    $location = "32.782778,-96.803889"
    $nagios_ping_rate = '!250.0,20%!400.0,60%'
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'softlayer02' inherits ringnode {
    $owner = "softlayer"
    $location = "29.76019,-95.36939"
    $nagios_ping_rate = '!250.0,20%!400.0,60%'
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'softlayer03' inherits ringnode {
    $owner = "softlayer"
    $location = "39.04376,-77.48744"
    $nagios_ping_rate = '!250.0,20%!400.0,60%'
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'softlayer04' inherits ringnode {
    $owner = "softlayer"
    $location = "37.33939,-121.89496"
    $nagios_ping_rate = '!500.0,20%!600.0,60%'
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'softlayer05' inherits ringnode {
    $owner = "softlayer"
    $location = "47.60621,-122.33207"
    $nagios_ping_rate = '!250.0,20%!400.0,60%'
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'softlayer06' inherits ringnode {
    $owner = "softlayer"
    $location = "1.35208,103.81984"
    $nagios_ping_rate = '!500.0,20%!800.0,60%'
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'imagine01' inherits ringnode {
    $owner = "imagine"
    $location = "53.334224,-6.365538"
    $nagios_ping_rate = '!250.0,20%!400.0,60%'
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'speedpartner01' inherits ringnode {
    $owner = "speedpartner"
    $location = "51.187842,6.866248"
    $nagios_ping_rate = '!250.0,20%!400.0,60%'
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'gossamerthreads01' inherits ringnode {
    $owner = "gossamerthreads"
    $location = "49.28496,-123.114411"
    $nagios_ping_rate = '!250.0,20%!400.0,60%'
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'towardex01' inherits ringnode {
    $owner = "towardex"
    $location = "42.354500508087064,-71.05950593948364"
    $nagios_ping_rate = '!250.0,20%!400.0,60%'
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'simplytransit01' inherits ringnode {
    $owner = "simplytransit"
    $location = "51.500544,-0.708647"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'isarnet01' inherits ringnode {
    $owner = "isarnet"
    $location = "48.32839,11.74318"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'strato01' inherits ringnode {
    $owner = "strato"
    $location = "52.465907,13.369467"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'edutel01' inherits ringnode {
    $owner = "edutel"
    $location = "51.445809,5.495128"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'sixdegrees01' inherits ringnode {
    $owner = "sixdegrees"
    $location = "52.278551,-1.895770"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'spacedump01' inherits ringnode {
    $owner = "spacedump"
    $location = "59.34803,18.03916"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'rbnetwork01' inherits ringnode {
    $owner = "rbnetwork"
    $location = "47.209726,9.529854"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'yourorg01' inherits ringnode {
    $owner = "yourorg"
    $location = "42.003056,-87.996389"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    $nagios_ping_rate = '!250.0,20%!400.0,60%'
    include set_local_settings                                                  
    include users
}

node 'occaid01' {
    include users::virtual::ring_admins
    include cronjobs
    include groups
    include nettools
    include etcfiles
    include local_binaries
    include nlnogrepokey
    include lang
#   ipv6 and munin no success yet
#    include munin::client
#    munin::plugin { ["users", "tcp", "ntp_offset", "uptime", "threads", "ntp_kernel_pll_off", "diskstats", "proc_pri", "iostat_ios"]:
#    }
#    package{ "munin": ensure => purged, }

    include ssh
    include timezone
#   ipv6 and fail2ban are not ok
#    include fail2ban-whitelist
    $postfix_smtp_listen = "127.0.0.1"
    $root_mail_recipient = "ring-admins@ring.nlnog.net"
    $postfix_myorigin = ""
    include postfix
    include resolving
    include users::virtual::ring_users
    include no-apache2
    include syslog_ng::client
    include nodesonlycron

    $owner = "occaid"
    $location = "47.619428,-122.348535"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    $nagios_ping_rate = '!280.0,20%!400.0,60%'
    include set_local_settings                                                  
    include users
}

node 'as250net01' inherits ringnode {
    $owner = "as250net"
    $location = "52.50200,13.37000"
    $nagios_ping_rate = '!180.0,20%!300.0,60%'
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'redpilllinpro01' inherits ringnode {
    $owner = "redpilllinpro"
    $location = "59.938612,10.83503"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'nine01' inherits ringnode {
    $owner = "nine"
    $location = "47.38340,8.49555"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'oneandone01' inherits ringnode {
    $owner = "oneandone"
    $location = "48.99984,8.38574"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'belwue01' inherits ringnode {
    $owner = "belwue"
    $location = "48.745500,9.1037"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'lagis01' inherits ringnode {
    $owner = "lagis"
    $location = "48.30694,14.28583"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'fnutt01' inherits ringnode {
    $owner = "fnutt"
    $location = "59.924855,10.809541"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'sidn01' inherits ringnode {
    $owner = "sidn"
    $location = "51.97696,5.96947"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'melbourne01' inherits ringnode {
    $owner = "melbourne"
    $location = "53.46517,-2.24686"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'go6lab01' inherits ringnode {
    $owner = "go6lab"
    $location = "46.16554,14.30661"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'siminn01' inherits ringnode {
    $owner = "siminn"
    $location = "55.66210,12.30134"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'a2binternet01' inherits ringnode {
    $owner = "a2binternet"
    $location = "52.62588,4.77044"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'i3d01' inherits ringnode {
    $owner = "i3d"
    $location = "51.92422,4.48178"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'digiweb01' inherits ringnode {
    $owner = "digiweb"
    $location = "53.406871,-6.372274"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'keenondots01' inherits ringnode {
    $owner = "keenondots"
    $location = "52.24416,6.76738"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'obenetwork01' inherits ringnode {
    $owner = "obenetwork"
    $location = "59.359621,17.980499"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'infomaniak01' inherits ringnode {
    $owner = "infomaniak"
    $location = "46.21755,6.08268"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'teamix01' inherits ringnode {
    $owner = "teamix"
    $location = "49.42788,11.02210"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'skyway01' inherits ringnode {
    $owner = "skyway"
    $location = "49.279285,7.107489"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                             
    include users
}

node 'solcon01' inherits ringnode {
    $owner = "solcon"
    $location = "52.53998,5.702248"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                             
    include users
}

node 'claranet01' inherits ringnode {
    $owner = "claranet"
    $location = "51.510901,-0.003482"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                             
    include users
}

node 'claranet02' inherits ringnode {
    $owner = "claranet"
    $location = "50.11529469499107,8.722994327545166"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                             
    include users
}

node 'claranet03' inherits ringnode {
    $owner = "claranet"
    $location = "51.499766912405946,5.456085205078125"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                             
    include users
}

node 'claranet04' inherits ringnode {
    $owner = "claranet"
    $location = "38.788052658004794,-9.123791456222534"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                             
    include users
}

node 'arpnetworks01' inherits ringnode {
    $owner = "arpnetworks"
    $location = "34.058723,-118.235299"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                             
    include users
    $nagios_ping_rate = '!200.0,20%!300.0,60%'
}

node 'iabg01' inherits ringnode {
    $owner = "iabg"
    $location = "48.05159,11.659881"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                             
    include users
}

node 'initseven01' inherits ringnode {
    $owner = "initseven"
    $location = "47.433647,8.559068"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                             
    include users
}

node 'hosting90systems01' inherits ringnode {
    $owner = "hosting90systems"
    $location = "50.078122,14.472277"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                             
    include users
}

node 'claranet05' inherits ringnode {
    $owner = "claranet"
    $location = "48.905224522197365, 2.2583717107772827"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                             
    include users
}

node 'kordia01' inherits ringnode {
    $owner = "kordia"
    $location = "-41.187501,174.946346"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                             
    include users
    $nagios_ping_rate = '!400.0,20%!600.0,60%'
}

node 'backbone01' inherits ringnode {
    $owner = "backbone"
    $location = "47.515065,7.617669"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                             
    include users
}

node 'backbone02' inherits ringnode {
    $owner = "backbone"
    $location = "64.145045,-21.907747"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                             
    include users
}

node 'nexellent01' inherits ringnode {
    $owner = "nexellent"
    $location = "47.432544,8.557972"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                             
    include users
}

node 'rbnetwork02' inherits ringnode {
    $owner = "rbnetwork"
    $location = "47.387639,8.519944"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'afilias01' inherits ringnode {
    $owner = "afilias"
    $location = "52.34398,4.82871"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'grnet01' inherits ringnode {
    $owner = "grnet"
    $location = "38.04581,23.788446"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'netflix01' inherits ringnode {
    $owner = "netflix"
    $location = "37.2415096,-121.7817521"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
    $nagios_ping_rate = '!200.0,20%!300.0,60%'
}

node 'ipmax01' inherits ringnode {
    $owner = "ipmax"
    $location = "45.723153,4.862412"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'merit01' inherits ringnode {
    $owner = "merit"
    $location = "42.248588,-83.736888"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
    $nagios_ping_rate = '!200.0,20%!300.0,60%'
}

node 'poznan01' inherits ringnode {
    $owner = "poznan"
    $location = "52.411433,16.917933"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'bluezonejordan01' inherits ringnode {
    $owner = "bluezonejordan"
    $location = "31.9579048,35.8697509"
    $nagios_ping_rate = '!350.0,20%!450.0,60%'
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'zeronet01' inherits ringnode {
    $owner = "zeronet"
    $location = "52.278519,-1.895536"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'claranet06' inherits ringnode {
    $owner = "claranet"
    $location = "41.351884, 2.13707"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'rgnet01' inherits ringnode {
    $owner = "rgnet"
    $location = "47.61435,-122.33852"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
    $nagios_ping_rate = '!250.0,20%!300.0,60%'
}

node 'ehsab01' inherits ringnode {
    $owner = "ehsab"
    $location = "59.306946,18.130274"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'ehsab02' inherits ringnode {
    $owner = "ehsab"
    $location = "55.606901,12.998484"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'yellowfiber01' inherits ringnode {
    $owner = "yellowfiber"
    $location = "38.954003,-77.36392"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'bahnhof01' inherits ringnode {
    $owner = "bahnhof"
    $location = "59.348034,18.039171"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'nicchile01' inherits ringnode {
    $owner = "nicchile"
    $location = "-33.457582,-70.663118"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
    $nagios_ping_rate = '!300.0,20%!400.0,60%'
}

node 'glesys01' inherits ringnode {
    $owner = "glesys"
    $location = "59.289688,18.016714"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'rcsrds01' inherits ringnode {
    $owner = "rcsrds"
    $location = "44.429187,26.079895"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'indit01' inherits ringnode {
    $owner = "indit"
    $location = "59.422474,17.918095"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'itmastaren01' inherits ringnode {
    $owner = "itmastaren"
    $location = "59.2722,15.2088"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'openminds01' inherits ringnode {
    $owner = "openminds"
    $location = "50.887222,4.455278"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'one01' inherits ringnode {
    $owner = "one"
    $location = "55.72687,12.37698"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'networking4all01' inherits ringnode {
    $owner = "networking4all"
    $location = "52.345054,4.832804"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'heanet01' inherits ringnode {
    $owner = "heanet"
    $location = "53.333145,-6.369291"
    $nagios_ping_rate = '!180.0,20%!300.0,60%'
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'algar01' inherits ringnode {
    $owner = "algar"
    $location = "-20.536090,-47.400950"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
    $nagios_ping_rate = '!250.0,20%!400.0,60%'
}

node 'qbranch01' inherits ringnode {
    $owner = "qbranch"
    $location = "59.325964,18.00222"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'nlnetlabs01' {
    include users::virtual::ring_admins
    include cronjobs
    include groups
    include nettools
    include etcfiles
    include local_binaries
    include nlnogrepokey
    include lang
#   ipv6 and munin no success yet
#    include munin::client
#    munin::plugin { ["users", "tcp", "ntp_offset", "uptime", "threads", "ntp_kernel_pll_off", "diskstats", "proc_pri", "iostat_ios"]:
#    }
#    package{ "munin": ensure => purged, }

    include ssh
    include timezone
#   ipv6 and fail2ban are not ok
#    include fail2ban-whitelist
    $postfix_smtp_listen = "127.0.0.1"
    $root_mail_recipient = "ring-admins@ring.nlnog.net"
    $postfix_myorigin = ""
    include postfix
    include resolving
    include users::virtual::ring_users
    include no-apache2
    include syslog_ng::client
    include nodesonlycron

    $owner = "nlnetlabs"
    $location = "52.356387,4.955663"
    include amp_client                                                    
    include nagios::target::fqdn                                                
    include nagios_services                                                     
    include set_local_settings                                                  
    include users
}

node 'entanet01' inherits ringnode {
    $owner = "entanet"
    $location = "52.67917,-2.41528"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'ripe01' inherits ringnode {
    $owner = "ripe"
    $location = "52.303062,4.937775"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'hosteurope01' inherits ringnode {
    $owner = "hosteurope"
    $location = "50.91061,7.06054"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'wirehive01' inherits ringnode {
    $owner = "wirehive"
    $location = "51.347629,-0.479842"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'nforce01' inherits ringnode {
    $owner = "nforce"
    $location = "52.3964434,4.8511319"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'xing01' inherits ringnode {
    $owner = "xing"
    $location = "50.08165,8.62295"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'xing02' inherits ringnode {
    $owner = "xing"
    $location = "50.09760,8.64410"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'serverchoice01' inherits ringnode {
    $owner = "serverchoice"
    $location = "51.889028,-0.204889"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'bredband201' inherits ringnode {
    $owner = "bredband2"
    $location = "55.574704,12.927673"
    $nagios_ping_rate = '!180.0,20%!300.0,60%'
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'cdw01' inherits ringnode {
    $owner = "cdw"
    $location = "43.00625847490064,-89.42570149898529"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
    $nagios_ping_rate = '!250.0,20%!400.0,60%'
}

node 'linxtelecom01' inherits ringnode {
    $owner = "linxtelecom"
    $location = "59.43621,24.70500"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'superonline01' inherits ringnode {
    $owner = "superonline"
    $location = "40.897996,29.193764"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'underworld01' inherits ringnode {
    $owner = "underworld"
    $location = "63.433333,10.4"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'adminor01' inherits ringnode {
    $owner = "adminor"
    $location = "59.301498,18.091709"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'videoplaza01' inherits ringnode {
    $owner = "videoplaza"
    $location = "59.263562,18.104843"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'rnp01' inherits ringnode {
    $owner = "rnp"
    $location = "-23.33167,-46.37119"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
    $nagios_ping_rate = '!300.0,20%!400.0,60%'
}

node 'iij01' inherits ringnode {
    $owner = "iij"
    $location = "35.683191,139.761949"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
    $nagios_ping_rate = '!300.0,20%!400.0,60%'
}

node 'beanfield01' inherits ringnode {
    $owner = "beanfield"
    $location = "43.638090,-79.425509"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
    $nagios_ping_rate = '!200.0,20%!300.0,60%'
}

node 'serioustubes01' inherits ringnode {
    $owner = "serioustubes"
    $location = "59.3268,18.0717"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'direcpath01' inherits ringnode {
    $owner = "direcpath"
    $location = "33.782149,-84.404582"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
    $nagios_ping_rate = '!200.0,20%!300.0,60%'
}

node 'dcsone01' inherits ringnode {
    $owner = "dcsone"
    $location = "1.31,103.75"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
    $nagios_ping_rate = '!350.0,20%!450.0,60%'
}

node 'berkeley01' inherits ringnode {
    $owner = "berkeley"
    $location = "37.874871,-122.258335"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
    $nagios_ping_rate = '!200.0,20%!300.0,60%'
}

node 'ispservices01' inherits ringnode {
    $owner = "ispservices"
    $location = "51.954204,6.300182"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'ausregistry01' inherits ringnode {
    $owner = "ausregistry"
    $location = "-37.822633,144.932208"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
    $nagios_ping_rate = '!400.0,20%!500.0,60%'
}

node 'switch01' inherits ringnode {
    $owner = "switch"
    $location = "47.38014,8.54459"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'hurricane01' inherits ringnode {
    $owner = "hurricane"
    $location = "37.49012,-121.93130"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
    $nagios_ping_rate = '!200.0,20%!300.0,60%'
}

node 'proserve01' inherits ringnode {
    $owner = "proserve"
    $location = "51.846185,4.679017"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'teletalk01' inherits ringnode {
    $owner = "teletalk"
    $location = "-12.984611,-38.467272"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
    $nagios_ping_rate = '!200.0,20%!300.0,60%'
}

node 'poppr01' inherits ringnode {
    $owner = "poppr"
    $location = "-25.445832,-49.233255"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
    $nagios_ping_rate = '!300.0,20%!400.0,60%'
}

node 'kaiaglobal01' inherits ringnode {
    $owner = "kaiaglobal"
    $location = "53.551004,10.047029"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'enestdata01' inherits ringnode {
    $owner = "enestdata"
    $location = "47.432913,8.557448"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'ualbany01' inherits ringnode {
    $owner = "ualbany"
    $location = "42.68619,-73.823996"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'masterinternet01' inherits ringnode {
    $owner = "masterinternet"
    $location = "49.196986,16.618667"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'icanndns01' inherits ringnode {
    $owner = "icanndns"
    $location = "33.91918,-118.41647"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
    $nagios_ping_rate = '!200.0,20%!300.0,60%'
}

node 'intellit01' inherits ringnode {
    $owner = "intellit"
    $location = "59.942783,10.717142"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'onet01' inherits ringnode {
    $owner = "onet"
    $location = "50.080482,19.892557"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'msu01' inherits ringnode {
    $owner = "msu"
    $location = "55.698164,37.531089"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'robtex01' inherits ringnode {
    $owner = "robtex"
    $location = "38.96350,-77.38076"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'dyn01' inherits ringnode {
    $owner = "dyn"
    $location = "35.617481,139.749775"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
    $nagios_ping_rate = '!300.0,20%!400.0,60%'
}

node 'trueinternet01' inherits ringnode {
    $owner = "trueinternet"
    $location = "13.759441,100.565325"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
    $nagios_ping_rate = '!250.0,20%!400.0,60%'
}

node 'phusion01' inherits ringnode {
    $owner = "phusion"
    $location = "54.973981,-1.600109"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'nimag01' inherits ringnode {
    $owner = "nimag"
    $location = "46.524,6.604"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'vancis01' inherits ringnode {
    $owner = "vancis"
    $location = "52.356257,4.952843"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'es01' inherits ringnode {
    $owner = "es"
    $location = "37.8752777778,-122.253055556"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
    $nagios_ping_rate = '!250.0,20%!400.0,60%'
}

node 'world4you01' inherits ringnode {
    $owner = "world4you"
    $location = "48.3191068,14.3082231"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'onet02' inherits ringnode {
    $owner = "onet"
    $location = "50.034678,20.013635"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node '4ddc01' inherits ringnode {
    $owner = "4ddc"
    $location = "51.347304,-0.480730"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'rackfish01' inherits ringnode {
    $owner = "rackfish"
    $location = "59.26356,18.10484"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'doruknet01' inherits ringnode {
    $owner = "doruknet"
    $location = "41.055149,29.00794"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'vocus01' inherits ringnode {
    $owner = "vocus"
    $location = "-33.91474,151.19302"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'hostvirtual01' inherits ringnode {
    $owner = "hostvirtual"
    $location = "13.042466,80.157013"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'hostvirtual02' inherits ringnode {
    $owner = "hostvirtual"
    $location = "22.36187,114.13502"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'mozilla01' inherits ringnode {
    $owner = "mozilla"
    $location = "37.37389,-121.97224"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'lightstorm01' inherits ringnode {
    $owner = "lightstorm"
    $location = "48.147874,17.132733"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'iccn01' inherits ringnode {
    $owner = "iccn"
    $location = "40.1131082,-88.2265234"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'popsc01' inherits ringnode {
    $owner = "popsc"
    $location = "-27.599548,-48.522928"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'sargasso01' inherits ringnode {
    $owner = "sargasso"
    $location = "51.521895,-0.07293"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'mythicbeasts01' inherits ringnode {
    $owner = "mythicbeasts"
    $location = "51.49964,-0.01074"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'transip01' inherits ringnode {
    $owner = "transip"
    $location = "52.393233,4.848914"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'sapphire01' inherits ringnode {
    $owner = "sapphire"
    $location = "36.142092,-5.358946"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'octopuce01' inherits ringnode {
    $owner = "octopuce"
    $location = "48.79609,2.412572"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'udomain01' inherits ringnode {
    $owner = "udomain"
    $location = "22.352507,114.124324"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'ipvisie01' inherits ringnode {
    $owner = "ipvisie"
    $location = "51.8756055,4.4480657"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'citynetwork01' inherits ringnode {
    $owner = "citynetwork"
    $location = "56.16122,15.58690"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'iplan01' inherits ringnode {
    $owner = "iplan"
    $location = "-34.640633,-58.404018"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'magyar01' inherits ringnode {
    $owner = "magyar"
    $location = "47.493275,19.102322"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'luna01' inherits ringnode {
    $owner = "luna"
    $location = "51.92609,4.41863"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'combell01' inherits ringnode {
    $owner = "combell"
    $location = "50.870572,4.47695"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'infostrada01' inherits ringnode {
    $owner = "infostrada"
    $location = "52.303081,4.937886"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'claranet07' inherits ringnode {
    $owner = "claranet"
    $location = "51.760427,-0.003073"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'blacklotus01' inherits ringnode {
    $owner = "blacklotus"
    $location = "34.047336,-118.257447"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'stargate01' inherits ringnode {
    $owner = "stargate"
    $location = "49.2436891,-122.9695433"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'etop01' inherits ringnode {
    $owner = "etop"
    $location = "52.194675,20.925358"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'dragon01' inherits ringnode {
    $owner = "dragon"
    $location = "50.0601906,14.4830350"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node '2connect01' inherits ringnode {
    $owner = "2connect"
    $location = "50.0601906,14.4830350"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'syseleven01' inherits ringnode {
    $owner = "syseleven"
    $location = "52.502038,13.369331"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'vertixo01' inherits ringnode {
    $owner = "vertixo"
    $location = "52.033297,4.497336"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'inerail01' inherits ringnode {
    $owner = "inerail"
    $location = "40.743384,-74.008027"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'kwaoo01' inherits ringnode {
    $owner = "kwaoo"
    $location = "46.203391,6.144675"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'atlanticmetro01' inherits ringnode {
    $owner = "atlanticmetro"
    $location = "40.7267165,-74.0075896"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'esgob01' inherits ringnode {
    $owner = "esgob"
    $location = "51.498311,-0.001528"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

node 'itsbrasil01' inherits ringnode {
    $owner = "itsbrasil"
    $location = "-12.980163,-38.450617"
    include amp_client
    include nagios::target::fqdn
    include nagios_services
    include set_local_settings
    include users
}

