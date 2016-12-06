# nodes.pp
#
## Hosts

node basenode {
    #include users::virtual::ring_admins
    include cronjobs
    include nettools
    include etcfiles
    include local_binaries
    include resolving
    include salt
}

node ringnode inherits basenode {
#    include no-apache2
    include syslog_ng::client
    include nodesonlycron
    include etcfiles_ring
    $postfix_smtp_listen = "127.0.0.1"
    $root_mail_recipient = "ring-admins@ring.nlnog.net"
    $postfix_myorigin = ""
    include postfix
    file { "/etc/puppet/puppet.conf":
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/etc/puppet/puppet.conf"
    }
    include scamper
    include uninstall_amp
}

node infranode inherits basenode {
    include etcfiles_infra
    $postfix_smtp_listen = "127.0.0.1"
    $root_mail_recipient = "ring-admins@ring.nlnog.net"
    $postfix_myorigin = ""
    include postfix
    file { "/etc/puppet/puppet.conf":
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/etc/puppet/puppet.conf"
    }
}

node inframailnode inherits basenode {
    include etcfiles_infra
    $postfix_smtp_listen = "0.0.0.0"
    $root_mail_recipient = "ring-admins@ring.nlnog.net"
    $postfix_home_mailbox = "Maildir/"
    $postfix_myorigin = ""
    include postfix
    file { "/etc/puppet/puppet.conf":
        owner   => root,
        group   => root,
        mode    => 644,
        source  => "puppet:///files/etc/puppet/puppet.conf"
    }
}

node 'master01.infra' inherits basenode {
    include etcfiles_infra
    include master_software
    include syslog_ng::server
    include apache2
    include mastercronjobs
    include trocla::config
    include usage_statistics
    include website
    include ring_auth::deployer
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
    include containercronjobs
    include syslog_ng::client
    include kvm
    include backup::client
    
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
    include syslog_ng::client
    include kvm
    include backup::client

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
    include syslog_ng::client
    include kvm
    include backup::client

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
    include syslog_ng::client
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

node 'dbmaster.infra' inherits infranode {
    $owner = "job"
    include syslog_ng::client
    include nodesonlycron
#    class { "mysql::server": 
#        config_hash => {
#            'root_password' => trocla("mysql_${fqdn}",'plain'),
#            'server-id'     => '666',
#        }
#    }
    include backup::client
    include ansible::master
    include dbmastercronjobs
}

# website, dns, mailing-list etc
node 'public01.infra' inherits infranode {
    $owner = "job"
    include syslog_ng::client
    include nodesonlycron
    include apache2
    include powerdns
    include map
# FIXME
# we moved to new puppet mysql module, but I can't predict what happens
# if we just use it here, especially with passwords. 
#    class { 'mysql::server':
#        config_hash => {
#            'root_password' => trocla("mysql_${fqdn}",'plain'),
#        }
#    }
    include pdnscronjobs
    include backup::client
}

node 'public02.infra' inherits inframailnode {
    $owner = "job"
    include syslog_ng::client
    include nodesonlycron
    include apache2
    include powerdns
    include backup::client
    file { "/usr/local/bin/ring-aptsummary":
        owner   => root,
        group   => root,
        mode    => 755,
        source  => "puppet:///files/usr/local/bin/ring-aptsummary"
    }
    cron {
        "ring-aptsummary":
        command => "/usr/local/bin/ring-aptsummary",
        user => apt,
        minute => "01",
        hour => "10",
        ensure => present,
    }
}

node 'public03.infra' inherits infranode {
    $owner = "job"
    include syslog_ng::client
    include nodesonlycron
    include apache2
    include powerdns
    include map
    include pdnscronjobs
    include backup::client
}

node 'backup.infra' inherits infranode {
    $owner = "job"
    include syslog_ng::client
    include nodesonlycron
    include backup::server
}

# looking glass 1
node 'lg01.infra' inherits infranode {
    $owner = "job"
    include syslog_ng::client
    include nodesonlycron
    include backup::client
    include bird
    include bird-lg-proxy
#    add_user { 'dave':                                                                                                                                                                                                 
#        email    => 'dave@claranet',
#        company => 'Claranet',
#        uid      => 6124,
#        groups  => ['ring-users', 'admin'],
#    }
#    authorized_keys { 'dave':
#        sshkeys => ['ssh-dss AAAAB3NzaC1kc3MAAACBANA+2Nq9N9IQfPqgmHhdYl932sxJb45PB/UgE/ATxOiP5Ev9sz6Vi+85WrD3kwYvszbRmdm6nIR6a5O861K8B+DKsYoWuE1tFxWgSszlbYzuTMXfPg+zI2IAen/YtzgsATnJPIKUub5bO18O3qGX5f/Xf21kJUsGdDx/F13Bb1UlAAAAFQC8JQHI/PW8wmZwmJKoLDHjb9W1XQAAAIEAq7/xIeDcg4FYiZeUl7VZxrB7HhMwBePOuBgpVyghYsJIM1wyWULN99aMxVQphZa77Y0I6UeaXoQu4Mt52O7Q8oq8FtxfCxUguFh0O+5qKZ66PjNmu/BC5s/GioxnoZ2baT/ka0xV3pQ01wZknk1Eb0ze750OdDs143Tq9eos2IkAAACBAJxziC4dxXJ6mOKYHdnEWRC57UFYxLwk5fKMemP0xJZk2/2Wahq+2pNoCWZvnUk6jWHMVhIV8BG7Bq37B1Qq/XuiEfkc+E1gCEYjwIhvvKYsR+SMeejCv1Bv7HV39ZPoGUjdYyQgciBrDCG13R1QShWNRcTK5liOTbyCcxI2QzTK david.freedman@uk.clara.net(RING)'],
#    }

}

# machine to manage auth material for ring users
node 'auth.infra' inherits infranode {
    $owner = "job"
    include syslog_ng::client
    include nodesonlycron
    include backup::client
    include ring_auth::landing
}

node 'compute01.infra' inherits infranode {
    $owner = "job"
    include backup::client
    include syslog_ng::client
}

node 'compute02.infra' inherits infranode {
    $owner = "job"
    include backup::client
    include syslog_ng::client
    include apache2
    $graphite_servername = 'graphite02.infra.ring.nlnog.net'
    include graphite
}

node 'storage01.infra' inherits infranode {
    $owner = "job"
    include syslog_ng::client
    include backup::server
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

#### define all ring nodes ####

node 'intouch01' inherits ringnode {
    $owner = "intouch"
    $location = "52.355930,4.951873"
	include users
}

node 'bit01' inherits ringnode {
    $owner = "bit"
    $location = "52.027596,5.624528"
	include users
}

node 'coloclue01' inherits ringnode {
    $owner = "coloclue"
    $location = "52.332901,4.919525"
	include users
}

node 'interconnect01' inherits ringnode {
    $owner = "interconnect"
    $location = "51.686672,5.359043"
	include users
}

node 'cambrium01' inherits ringnode {
    $owner = "cambrium"
    $location = "52.340988,5.227518"
	include users
}

node 'cyso01' inherits ringnode {
    $owner = "cyso"
    $location = "52.343983,4.828710"
	include users
}

node 'zylon01' inherits ringnode {
    $owner = "zylon"
    $location = "52.396420,4.851092"
	include users
}

node 'duocast01' inherits ringnode {
    $owner = "duocast"
    $location = "53.246086,6.528518"
	include users
}

node 'easyhosting01' inherits ringnode {
    $owner = "easyhosting"
    $location = "52.391132,4.665263"
	include users
}

node 'previder01' inherits ringnode {
    $owner = "previder"
    $location = "52.243954,6.767229"
	include users
}

node 'leaseweb01' inherits ringnode {
    $owner = "leaseweb"
    $location = "52.391224,4.665155"
	include users
}

node 'xs4all01' inherits ringnode {
    $owner = "xs4all"
    $location = "52.336353,4.886652"
	include users
}

node 'nedzone01' inherits ringnode {
    $owner = "nedzone"
    $location = "51.587601,4.305047"
	include users
}

node 'oxilion01' inherits ringnode {
    $owner = "oxilion"
    $location = "52.243969,6.767278"
	include users
}

node 'ebayclassifiedsgroup01' inherits ringnode {
    $owner = "ebayclassifiedsgroup"
    $location = "52.280964,4.754237"
	include users
}

node 'is01' inherits ringnode {
    $owner = "is"
    $location = "52.396759,4.838742"
	include users
}

node 'surfnet01' inherits ringnode {
    $owner = "surfnet"
    $location = "52.090767,5.112371"
	include users
}

node 'prolocation01' inherits ringnode {
    $owner = "prolocation"
    $location = "52.343983,4.828710"
	include users
}

node 'in2ip01' inherits ringnode {
    $owner = "in2ip"
    $location = "52.395855,4.841133"
	include users
}

node 'totaalnet01' inherits ringnode {
    $owner = "totaalnet"
    $location = "51.987831,5.933394"
	include users
}

node 'signet01' inherits ringnode {
    $owner = "signet"
    $location = "51.501537,5.460406"
	include users
}

node 'tripleit01' inherits ringnode {
    $owner = "tripleit"
    $location = "52.303066,4.937898"
	include users
}

node 'jaguarnetwork01' inherits ringnode {
    $owner = "jaguarnetwork"
    $location = "43.310226,5.373356"
	include users
}

node 'tuxis01' inherits ringnode {
    $owner = "tuxis"
    $location = "52.027649,5.624506"
	include users
}

node 'tenet01' inherits ringnode {
    $owner = "tenet"
    $location = "-26.204103,28.047304"
	include users
}

node 'netability01' inherits ringnode {
    $owner = "netability"
    $location = "53.405754,-6.372293"
	include users
}

node 'unilogicnetworks01' inherits ringnode {
    $owner = "unilogicnetworks"
    $location = "50.996090,5.845644"
	include users
}

node 'maverick01' inherits ringnode {
    $owner = "maverick"
    $location = "52.393036,16.947895"
	include users
}

node 'acsystemy01' inherits ringnode {
    $owner = "acsystemy"
    $location = "53.910034,14.247578"
	include users
}

node 'netsign01' inherits ringnode {
    $owner = "netsign"
    $location = "52.465530,13.368666"
	include users
}

node 'rrbone01' inherits ringnode {
    $owner = "rrbone"
    $location = "51.188271,6.867769"
	include users
}

node 'hosteam01' inherits ringnode {
    $owner = "hosteam"
    $location = "52.227661,21.004250"
	include users
}

node 'inotel01' inherits ringnode {
    $owner = "inotel"
    $location = "52.391102,16.897284"
	include users
}

node 'fremaks01' inherits ringnode {
    $owner = "fremaks"
    $location = "53.077320,8.772950"
	include users
}

node 'blix01' inherits ringnode {
    $owner = "blix"
    $location = "59.924725,10.810183"
	include users
}

node 'portlane01' inherits ringnode {
    $owner = "portlane"
    $location = "59.306946,18.130274"
	include users
}

node 'solido01' inherits ringnode {
    $owner = "solido"
    $location = "55.728542,12.376454"
	include users
}

node 'solido02' inherits ringnode {
    $owner = "solido"
    $location = "49.50481,6.11237"
	include users
}

node 'digmia01' inherits ringnode {
    $owner = "digmia"
    $location = "48.119209,17.095844"
	include users
}

node 'rootlu01' inherits ringnode {
    $owner = "rootlu"
    $location = "49.671227,6.125205"
	include users
}

node 'nebula01' inherits ringnode {
    $owner = "nebula"
    $location = "60.218018,24.879240"
	include users
}

node 'tilaa01' inherits ringnode {
    $owner = "tilaa"
    $location = "52.391090,4.665314"
	include users
}

node 'nautile01' inherits ringnode {
    $owner = "nautile"
    $location = "-22.267935,166.462219"
	include users
}

node 'voxel01' inherits ringnode {
    $owner = "voxel"
    $location = "37.241619,-121.783218"
	include users
}

node 'voxel02' inherits ringnode {
    $owner = "voxel"
    $location = "1.295461,103.789787"
	include users
}

node 'apnic01' inherits ringnode {
    $owner = "apnic"
    $location = "-27.458248,153.031067"
	include users
}

node 'hibernia01' inherits ringnode {
    $owner = "hibernia"
    $location = "41.87811,-87.62980"
	include users
}

node 'man-da01' inherits ringnode {
    $owner = "man-da"
    $location = "49.86170,8.68210"
	include users
}

node 'webair01' inherits ringnode {
    $owner = "webair"
    $location = "40.722529,-73.632961"
	include users
}

node 'concepts-ict01' inherits ringnode {
    $owner = "concepts-ict"
    $location = "51.592992,4.802703"
	include users
}

node 'dataoppdrag01' inherits ringnode {
    $owner = "dataoppdrag"
    $location = "60.295349,5.255753"
	include users
}

node 'tetaneutral01' inherits ringnode {
    $owner = "tetaneutral"
    $location = "43.61847,1.42075"
	include users
}

node 'jump01' inherits ringnode {
    $owner = "jump"
    $location = "51.5120776,-0.0020345"
	include users
}

node 'iway01' inherits ringnode {
    $owner = "iway"
    $location = "47.387639,8.519944"
	include users
}

node 'rezopole01' inherits ringnode {
    $owner = "rezopole"
    $location = "45.72289,4.861422"
	include users
}

node 'solnet01' inherits ringnode {
    $owner = "solnet"
    $location = "47.20182,7.52878"
	include users
}

node 'boxed-it01' inherits ringnode {
    $owner = "boxed-it"
    $location = "50.875425,4.499401"
	include users
}

node 'spacenet01' inherits ringnode {
    $owner = "spacenet"
    $location = "48.133333,11.566667"
	include users
}

node 'mironet01' inherits ringnode {
    $owner = "mironet"
    $location = "47.5143,7.616726"
	include users
}

node 'seeweb01' inherits ringnode {
    $owner = "seeweb"
    $location = "45.478696,9.105091"
	include users
}

node 'zensystems01' inherits ringnode {
    $owner = "zensystems"
    $location = "55.7284634,12.376985"
	include users
}

node 'westnet01' inherits ringnode {
    $owner = "westnet"
    $location = "53.858024,-9.279904"
	include users
}

node 'kantonsschulezug01' inherits ringnode {
    $owner = "kantonsschulezug"
    $location = "47.1744,8.5233"
	include users
}

node 'filoo01' inherits ringnode {
    $owner = "filoo"
    $location = "50.09676,8.628393"
	include users
}

node 'nessus01' inherits ringnode {
    $owner = "nessus"
    $location = "48.179737,16.364007"
	include users
}

node 'amazon01' inherits ringnode {
    $owner = "amazon"
    $location = "38.944444,-77.455833"
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
	include users
}

node 'lchost01' inherits ringnode {
    $owner = "lchost"
    $location = "51.496716,-0.017987"
	include users
}

node 'hostway01' inherits ringnode {
    $owner = "hostway"
    $location = "49.288462,-123.118197"
	include users
}

node 'pcextreme01' inherits ringnode {
    $owner = "pcextreme"
    $location = "52.400483,4.842865"
	include users
}

node 'antagonist01' inherits ringnode {
    $owner = "antagonist"
    $location = "52.244396,6.767321"
	include users
}

node 'nts01' inherits ringnode {
    $owner = "nts"
    $location = "46.936647,7.429907"
	include users
}

node 'multiplay01' inherits ringnode {
    $owner = "multiplay"
    $location = "51.520493,-0.073546"
    include set_local_settings                                                  
}

node 'softlayer01' inherits ringnode {
    $owner = "softlayer"
    $location = "32.782778,-96.803889"
    include set_local_settings                                                  
}

node 'softlayer02' inherits ringnode {
    $owner = "softlayer"
    $location = "29.76019,-95.36939"
    include set_local_settings                                                  
}

node 'softlayer03' inherits ringnode {
    $owner = "softlayer"
    $location = "39.04376,-77.48744"
    include set_local_settings                                                  
}

node 'softlayer04' inherits ringnode {
    $owner = "softlayer"
    $location = "37.33939,-121.89496"
    include set_local_settings                                                  
}

node 'softlayer05' inherits ringnode {
    $owner = "softlayer"
    $location = "47.60621,-122.33207"
    include set_local_settings                                                  
}

node 'softlayer06' inherits ringnode {
    $owner = "softlayer"
    $location = "1.35208,103.81984"
    include set_local_settings                                                  
}

node 'imagine01' inherits ringnode {
    $owner = "imagine"
    $location = "53.334224,-6.365538"
    include set_local_settings                                                  
}

node 'speedpartner01' inherits ringnode {
    $owner = "speedpartner"
    $location = "51.187842,6.866248"
    include set_local_settings                                                  
}

node 'gossamerthreads01' inherits ringnode {
    $owner = "gossamerthreads"
    $location = "49.28496,-123.114411"
    include set_local_settings                                                  
}

node 'towardex01' inherits ringnode {
    $owner = "towardex"
    $location = "42.354500508087064,-71.05950593948364"
    include set_local_settings                                                  
}

node 'simplytransit01' inherits ringnode {
    $owner = "simplytransit"
    $location = "51.500544,-0.708647"
    include set_local_settings                                                  
}

node 'isarnet01' inherits ringnode {
    $owner = "isarnet"
    $location = "48.32839,11.74318"
    include set_local_settings                                                  
}

node 'strato01' inherits ringnode {
    $owner = "strato"
    $location = "52.465907,13.369467"
    include set_local_settings                                                  
}

node 'edutel01' inherits ringnode {
    $owner = "edutel"
    $location = "51.445809,5.495128"
    include set_local_settings                                                  
}

node 'sixdegrees01' inherits ringnode {
    $owner = "sixdegrees"
    $location = "52.278551,-1.895770"
    include set_local_settings                                                  
}

node 'spacedump01' inherits ringnode {
    $owner = "spacedump"
    $location = "59.34803,18.03916"
    include set_local_settings                                                  
}

node 'yourorg01' inherits ringnode {
    $owner = "yourorg"
    $location = "42.003056,-87.996389"
    include set_local_settings                                                  
}

node 'occaid01' {
    include salt
    include users::virtual::ring_admins
    include cronjobs
    include nettools
    include etcfiles
    include local_binaries

    $postfix_smtp_listen = "127.0.0.1"
    $root_mail_recipient = "ring-admins@ring.nlnog.net"
    $postfix_myorigin = ""
    include postfix
    include resolving
    include no-apache2
    include syslog_ng::client
    include nodesonlycron

    $owner = "occaid"
    $location = "47.619428,-122.348535"
    include set_local_settings                                                  
}

node 'as250net01' inherits ringnode {
    $owner = "as250net"
    $location = "52.50200,13.37000"
    include set_local_settings                                                  
}

node 'redpilllinpro01' inherits ringnode {
    $owner = "redpilllinpro"
    $location = "59.938612,10.83503"
    include set_local_settings                                                  
}

node 'nine01' inherits ringnode {
    $owner = "nine"
    $location = "47.383109,8.495504"
}

node 'belwue01' inherits ringnode {
    $owner = "belwue"
    $location = "48.745500,9.1037"
    include set_local_settings                                                  
}

node 'lagis01' inherits ringnode {
    $owner = "lagis"
    $location = "48.30694,14.28583"
    include set_local_settings                                                  
}

node 'fnutt01' inherits ringnode {
    $owner = "fnutt"
    $location = "59.924855,10.809541"
    include set_local_settings                                                  
}

node 'sidn01' inherits ringnode {
    $owner = "sidn"
    $location = "51.97696,5.96947"
    include set_local_settings                                                  
}

node 'melbourne01' inherits ringnode {
    $owner = "melbourne"
    $location = "53.46517,-2.24686"
    include set_local_settings                                                  
}

node 'go6lab01' inherits ringnode {
    $owner = "go6lab"
    $location = "46.16554,14.30661"
    include set_local_settings                                                  
}

node 'siminn01' inherits ringnode {
    $owner = "siminn"
    $location = "55.66210,12.30134"
    include set_local_settings                                                  
}

node 'a2binternet01' inherits ringnode {
    $owner = "a2binternet"
    $location = "52.62588,4.77044"
    include set_local_settings                                                  
}

node 'i3d01' inherits ringnode {
    $owner = "i3d"
    $location = "51.92422,4.48178"
    include set_local_settings                                                  
}

node 'viatel01' inherits ringnode {
    $owner = "viatel"
    $location = "53.406871,-6.372274"
    include set_local_settings                                                  
}

node 'keenondots01' inherits ringnode {
    $owner = "keenondots"
    $location = "52.24416,6.76738"
    include set_local_settings                                                  
}

node 'obenetwork01' inherits ringnode {
    $owner = "obenetwork"
    $location = "59.359621,17.980499"
    include set_local_settings                                                  
}

node 'infomaniak01' inherits ringnode {
    $owner = "infomaniak"
    $location = "46.21755,6.08268"
    include set_local_settings                                                  
}

node 'teamix01' inherits ringnode {
    $owner = "teamix"
    $location = "49.42788,11.02210"
    include set_local_settings                                                  
}

node 'skyway01' inherits ringnode {
    $owner = "skyway"
    $location = "49.279285,7.107489"
    include set_local_settings                                             
}

node 'solcon01' inherits ringnode {
    $owner = "solcon"
    $location = "52.53998,5.702248"
    include set_local_settings                                             
}

node 'claranet01' inherits ringnode {
    $owner = "claranet"
    $location = "51.510901,-0.003482"
    include set_local_settings                                             
}

node 'claranet02' inherits ringnode {
    $owner = "claranet"
    $location = "50.11529469499107,8.722994327545166"
    include set_local_settings                                             
}

node 'claranet03' inherits ringnode {
    $owner = "claranet"
    $location = "51.499766912405946,5.456085205078125"
    include set_local_settings                                             
}

node 'claranet04' inherits ringnode {
    $owner = "claranet"
    $location = "38.788052658004794,-9.123791456222534"
    include set_local_settings                                             
}

node 'arpnetworks01' inherits ringnode {
    $owner = "arpnetworks"
    $location = "34.058723,-118.235299"
    include set_local_settings                                             
}

node 'iabg01' inherits ringnode {
    $owner = "iabg"
    $location = "48.05159,11.659881"
    include set_local_settings                                             
}

node 'initseven01' inherits ringnode {
    $owner = "initseven"
    $location = "47.433647,8.559068"
    include set_local_settings                                             
}

node 'hosting90systems01' inherits ringnode {
    $owner = "hosting90systems"
    $location = "50.078122,14.472277"
    include set_local_settings                                             
}

node 'claranet05' inherits ringnode {
    $owner = "claranet"
    $location = "48.905224522197365, 2.2583717107772827"
    include set_local_settings                                             
}

node 'kordia01' inherits ringnode {
    $owner = "kordia"
    $location = "-41.187501,174.946346"
    include set_local_settings                                             
}

node 'nexellent01' inherits ringnode {
    $owner = "nexellent"
    $location = "47.432544,8.557972"
    include set_local_settings                                             
}

node 'afilias01' inherits ringnode {
    $owner = "afilias"
    $location = "52.34398,4.82871"
    include set_local_settings                                                  
}

node 'grnet01' inherits ringnode {
    $owner = "grnet"
    $location = "38.04581,23.788446"
    include set_local_settings                                                  
}

node 'ipmax01' inherits ringnode {
    $owner = "ipmax"
    $location = "45.723153,4.862412"
    include set_local_settings                                                  
}

node 'merit01' inherits ringnode {
    $owner = "merit"
    $location = "42.248588,-83.736888"
    include set_local_settings                                                  
}

node 'poznan01' inherits ringnode {
    $owner = "poznan"
    $location = "52.411433,16.917933"
    include set_local_settings                                                  
}

node 'bluezonejordan01' inherits ringnode {
    $owner = "bluezonejordan"
    $location = "31.9579048,35.8697509"
    include set_local_settings                                                  
}

node 'zeronet01' inherits ringnode {
    $owner = "zeronet"
    $location = "52.278519,-1.895536"
    include set_local_settings                                                  
}

node 'claranet06' inherits ringnode {
    $owner = "claranet"
    $location = "41.351884, 2.13707"
    include set_local_settings                                                  
}

node 'rgnet01' inherits ringnode {
    $owner = "rgnet"
    $location = "47.61435,-122.33852"
    include set_local_settings                                                  
}

node 'ehsab01' inherits ringnode {
    $owner = "ehsab"
    $location = "59.306946,18.130274"
    include set_local_settings                                                  
}

node 'ehsab02' inherits ringnode {
    $owner = "ehsab"
    $location = "55.606901,12.998484"
    include set_local_settings                                                  
}

node 'yellowfiber01' inherits ringnode {
    $owner = "yellowfiber"
    $location = "38.954003,-77.36392"
    include set_local_settings                                                  
}

node 'bahnhof01' inherits ringnode {
    $owner = "bahnhof"
    $location = "59.348034,18.039171"
    include set_local_settings                                                  
}

node 'nicchile01' inherits ringnode {
    $owner = "nicchile"
    $location = "-33.457582,-70.663118"
    include set_local_settings                                                  
}

node 'glesys01' inherits ringnode {
    $owner = "glesys"
    $location = "59.289688,18.016714"
    include set_local_settings                                                  
}

node 'rcsrds01' inherits ringnode {
    $owner = "rcsrds"
    $location = "44.429187,26.079895"
    include set_local_settings                                                  
}

node 'itmastaren01' inherits ringnode {
    $owner = "itmastaren"
    $location = "59.2722,15.2088"
    include set_local_settings                                                  
}

node 'openminds01' inherits ringnode {
    $owner = "openminds"
    $location = "50.887222,4.455278"
}

node 'one01' inherits ringnode {
    $owner = "one"
    $location = "55.72687,12.37698"
}

node 'heanet01' inherits ringnode {
    $owner = "heanet"
    $location = "53.333145,-6.369291"
}

node 'algar01' inherits ringnode {
    $owner = "algar"
    $location = "-20.536090,-47.400950"
}

node 'qbranch01' inherits ringnode {
    $owner = "qbranch"
    $location = "59.325964,18.00222"
}

node 'nlnetlabs01' inherits ringnode {
    $owner = "nlnetlabs"
    $location = "52.356387,4.955663"
    include set_local_settings                                                  
}

node 'entanet01' inherits ringnode {
    $owner = "entanet"
    $location = "52.67917,-2.41528"
}

node 'ripe01' inherits ringnode {
    $owner = "ripe"
    $location = "52.303062,4.937775"
}

node 'hosteurope01' inherits ringnode {
    $owner = "hosteurope"
    $location = "50.91061,7.06054"
}

node 'wirehive01' inherits ringnode {
    $owner = "wirehive"
    $location = "51.347629,-0.479842"
}

node 'nforce01' inherits ringnode {
    $owner = "nforce"
    $location = "52.3964434,4.8511319"
}

node 'xing01' inherits ringnode {
    $owner = "xing"
    $location = "50.08165,8.62295"
}

node 'xing02' inherits ringnode {
    $owner = "xing"
    $location = "50.09760,8.64410"
}

node 'serverchoice01' inherits ringnode {
    $owner = "serverchoice"
    $location = "51.889028,-0.204889"
}

node 'bredband201' inherits ringnode {
    $owner = "bredband2"
    $location = "55.574704,12.927673"
}

node 'cdw01' inherits ringnode {
    $owner = "cdw"
    $location = "43.00625847490064,-89.42570149898529"
}

node 'linxtelecom01' inherits ringnode {
    $owner = "linxtelecom"
    $location = "59.43621,24.70500"
}

node 'superonline01' inherits ringnode {
    $owner = "superonline"
    $location = "40.897996,29.193764"
}

node 'underworld01' inherits ringnode {
    $owner = "underworld"
    $location = "63.433333,10.4"
}

node 'adminor01' inherits ringnode {
    $owner = "adminor"
    $location = "59.301498,18.091709"
}

node 'videoplaza01' inherits ringnode {
    $owner = "videoplaza"
    $location = "59.263562,18.104843"
}

node 'rnp01' inherits ringnode {
    $owner = "rnp"
    $location = "-23.33167,-46.37119"
}

node 'iij01' inherits ringnode {
    $owner = "iij"
    $location = "35.683191,139.761949"
}

node 'beanfield01' inherits ringnode {
    $owner = "beanfield"
    $location = "43.638090,-79.425509"
}

node 'serioustubes01' inherits ringnode {
    $owner = "serioustubes"
    $location = "59.3268,18.0717"
}

node 'direcpath01' inherits ringnode {
    $owner = "direcpath"
    $location = "33.782149,-84.404582"
}

node 'dcsone01' inherits ringnode {
    $owner = "dcsone"
    $location = "1.31,103.75"
}

node 'berkeley01' inherits ringnode {
    $owner = "berkeley"
    $location = "37.874871,-122.258335"
}

node 'ispservices01' inherits ringnode {
    $owner = "ispservices"
    $location = "51.954204,6.300182"
}

node 'ausregistry01' inherits ringnode {
    $owner = "ausregistry"
    $location = "-37.822633,144.932208"
}

node 'switch01' inherits ringnode {
    $owner = "switch"
    $location = "47.38014,8.54459"
}

node 'hurricane01' inherits ringnode {
    $owner = "hurricane"
    $location = "37.49012,-121.93130"
}

node 'proserve01' inherits ringnode {
    $owner = "proserve"
    $location = "51.846185,4.679017"
}

node 'teletalk01' inherits ringnode {
    $owner = "teletalk"
    $location = "-12.984611,-38.467272"
}

node 'poppr01' inherits ringnode {
    $owner = "poppr"
    $location = "-25.445832,-49.233255"
}

node 'kaiaglobal01' inherits ringnode {
    $owner = "kaiaglobal"
    $location = "53.55108,9.99368"
}

node 'ualbany01' inherits ringnode {
    $owner = "ualbany"
    $location = "42.68619,-73.823996"
}

node 'masterinternet01' inherits ringnode {
    $owner = "masterinternet"
    $location = "49.196986,16.618667"
}

node 'intellit01' inherits ringnode {
    $owner = "intellit"
    $location = "59.942783,10.717142"
}

node 'onet01' inherits ringnode {
    $owner = "onet"
    $location = "50.080482,19.892557"
}

node 'msu01' inherits ringnode {
    $owner = "msu"
    $location = "55.698164,37.531089"
}

node 'dyn01' inherits ringnode {
    $owner = "dyn"
    $location = "35.617481,139.749775"
}

node 'trueinternet01' inherits ringnode {
    $owner = "trueinternet"
    $location = "13.759441,100.565325"
}

node 'phusion01' inherits ringnode {
    $owner = "phusion"
    $location = "54.973981,-1.600109"
}

node 'nimag01' inherits ringnode {
    $owner = "nimag"
    $location = "46.524,6.604"
}

node 'vancis01' inherits ringnode {
    $owner = "vancis"
    $location = "52.356257,4.952843"
}

node 'es01' inherits ringnode {
    $owner = "es"
    $location = "37.8752777778,-122.253055556"
}

node 'world4you01' inherits ringnode {
    $owner = "world4you"
    $location = "48.3191068,14.3082231"
}

node 'onet02' inherits ringnode {
    $owner = "onet"
    $location = "50.034678,20.013635"
}

node '4ddc01' inherits ringnode {
    $owner = "4ddc"
    $location = "51.347304,-0.480730"
}

node 'rackfish01' inherits ringnode {
    $owner = "rackfish"
    $location = "59.26356,18.10484"
}

node 'doruknet01' inherits ringnode {
    $owner = "doruknet"
    $location = "41.055149,29.00794"
}

node 'vocus01' inherits ringnode {
    $owner = "vocus"
    $location = "-33.91474,151.19302"
}

node 'hostvirtual01' inherits ringnode {
    $owner = "hostvirtual"
    $location = "13.042466,80.157013"
}

node 'hostvirtual02' inherits ringnode {
    $owner = "hostvirtual"
    $location = "22.36187,114.13502"
}

node 'mozilla01' inherits ringnode {
    $owner = "mozilla"
    $location = "37.37389,-121.97224"
}

node 'lightstorm01' inherits ringnode {
    $owner = "lightstorm"
    $location = "48.147874,17.132733"
}

node 'iccn01' inherits ringnode {
    $owner = "iccn"
    $location = "40.1131082,-88.2265234"
}

node 'popsc01' inherits ringnode {
    $owner = "popsc"
    $location = "-27.599548,-48.522928"
}

node 'sargasso01' inherits ringnode {
    $owner = "sargasso"
    $location = "51.521895,-0.07293"
}

node 'mythicbeasts01' inherits ringnode {
    $owner = "mythicbeasts"
    $location = "51.49964,-0.01074"
}

node 'transip01' inherits ringnode {
    $owner = "transip"
    $location = "52.393233,4.848914"
}

node 'sapphire01' inherits ringnode {
    $owner = "sapphire"
    $location = "36.142092,-5.358946"
}

node 'octopuce01' inherits ringnode {
    $owner = "octopuce"
    $location = "48.79609,2.412572"
}

node 'udomain01' inherits ringnode {
    $owner = "udomain"
    $location = "22.352507,114.124324"
}

node 'ipvisie01' inherits ringnode {
    $owner = "ipvisie"
    $location = "51.8756055,4.4480657"
}

node 'citynetwork01' inherits ringnode {
    $owner = "citynetwork"
    $location = "56.16122,15.58690"
}

node 'iplan01' inherits ringnode {
    $owner = "iplan"
    $location = "-34.640633,-58.404018"
}

node 'magyar01' inherits ringnode {
    $owner = "magyar"
    $location = "47.493275,19.102322"
}

node 'luna01' inherits ringnode {
    $owner = "luna"
    $location = "51.92609,4.41863"
}

node 'combell01' inherits ringnode {
    $owner = "combell"
    $location = "50.870572,4.47695"
}

node 'infostrada01' inherits ringnode {
    $owner = "infostrada"
    $location = "52.303081,4.937886"
}

node 'claranet07' inherits ringnode {
    $owner = "claranet"
    $location = "51.760427,-0.003073"
}

node 'stargate01' inherits ringnode {
    $owner = "stargate"
    $location = "49.2436891,-122.9695433"
}

node 'etop01' inherits ringnode {
    $owner = "etop"
    $location = "52.194675,20.925358"
}

node 'dragon01' inherits ringnode {
    $owner = "dragon"
    $location = "50.0601906,14.4830350"
}

node '2connect01' inherits ringnode {
    $owner = "2connect"
    $location = "50.0601906,14.4830350"
}

node 'syseleven01' inherits ringnode {
    $owner = "syseleven"
    $location = "52.502038,13.369331"
}

node 'vertixo01' inherits ringnode {
    $owner = "vertixo"
    $location = "52.033297,4.497336"
}

node 'kwaoo01' inherits ringnode {
    $owner = "kwaoo"
    $location = "46.203391,6.144675"
}

node 'atlanticmetro01' inherits ringnode {
    $owner = "atlanticmetro"
    $location = "40.7267165,-74.0075896"
}

node 'esgob01' inherits ringnode {
    $owner = "esgob"
    $location = "51.498311,-0.001528"
}

node 'itsbrasil01' inherits ringnode {
    $owner = "itsbrasil"
    $location = "-12.980163,-38.450617"
}

node 'finecom01' inherits ringnode {
    $owner = "finecom"
    $location = "47.131732,7.24166"
}

node 'sbtap01' inherits ringnode {
    $owner = "sbtap"
    $location = "42.94334338754859,13.882770538330078"
}

node 'spotify01' inherits ringnode {
    $owner = "spotify"
    $location = "59.263504,18.105463"
}

node 'xconnect01' inherits ringnode {
    $owner = "xconnect"
    $location = "52.343984,4.828712"
}

node 'amsio01' inherits ringnode {
    $owner = "amsio"
    $location = "52.280312,4.753851"
}

node 'goscomb01' inherits ringnode {
    $owner = "goscomb"
    $location = "51.512078,-0.002035"
}

node 'kinber01' inherits ringnode {
    $owner = "kinber"
    $location = "40.7914,-77.8586"
}

node 'afilias02' inherits ringnode {
    $owner = "afilias"
    $location = "25.773914,-80.188007"
}

node 'nonattached01' inherits ringnode {
    $owner = "nonattached"
    $location = "50.102565,8.633623"
}

node 'kpn01' inherits ringnode {
    $owner = "kpn"
    $location = "52.33661,4.88685"
}

node 'suomi01' inherits ringnode {
    $owner = "suomi"
    $location = "60.20336,24.923601"
}

node 'maxitel01' inherits ringnode {
    $owner = "maxitel"
    $location = "51.85615,4.29722"
}

node 'flhsi01' inherits ringnode {
    $owner = "flhsi"
    $location = "28.355719,-80.744278"
}

node 'virtualone01' inherits ringnode {
    $owner = "virtualone"
    $location = "51.51138,-0.00180"
}

node 'swisscom01' inherits ringnode {
    $owner = "swisscom"
    $location = "46.9503047,7.4415524"
}

node 'telus01' inherits ringnode {
    $owner = "telus"
    $location = "51.0471725,-114.0651321"
}

node 'selectel01' inherits ringnode {
    $owner = "selectel"
    $location = "59.886598,30.329322"
}

node 'infowest01' inherits ringnode {
    $owner = "infowest"
    $location = "37.081474,-113.607170"
}

node 'funet01' inherits ringnode {
    $owner = "funet"
    $location = "60.203863,24.77146"
}

node 'dcenterpl01' inherits ringnode {
    $owner = "dcenterpl"
    $location = "52.22694,21.00164"
}

node 'cybercom01' inherits ringnode {
    $owner = "cybercom"
    $location = "61.49791,23.77586"
}

node 'hivane01' inherits ringnode {
    $owner = "hivane"
    $location = "48.815068,2.403053"
}

node 'fullsave01' inherits ringnode {
    $owner = "fullsave"
    $location = "43.542635,1.509676"
}

node 'equinixfi01' inherits ringnode {
    $owner = "equinixfi"
    $location = "60.169,24.959"
}

node 'itps01' inherits ringnode {
    $owner = "itps"
    $location = "51.49934,-0.01442"
}

node 'afilias03' inherits ringnode {
    $owner = "afilias"
    $location = "35.584732,139.748758"
}

node 'cyberverse01' inherits ringnode {
    $owner = "cyberverse"
    $location = "34.0473,-118.2573"
}

node 'viatel02' inherits ringnode {
    $owner = "viatel"
    $location = "48.856261,2.383975"
}

node 'viatel03' inherits ringnode {
    $owner = "viatel"
    $location = "51.51218,-0.00208"
}

node 'ntt01' inherits ringnode {
    $owner = "ntt"
    $location = "41.85286,-87.63448"
}

node 'bogalnet01' inherits ringnode {
    $owner = "bogalnet"
    $location = "58.032304,12.808976"
}

node 'iucc01' inherits ringnode {
    $owner = "iucc"
    $location = "32.1132,34.8053"
}

node 'nynex01' inherits ringnode {
    $owner = "nynex"
    $location = "8.6269,49.8706"
}

node 'businessconnect01' inherits ringnode {
    $owner = "businessconnect"
    $location = "52.356156,4.955187"
}

node 'noris01' inherits ringnode {
    $owner = "noris"
    $location = "49.41022,11.13191"
}

node 'mknetzdienste01' inherits ringnode {
    $owner = "mknetzdienste"
    $location = "50.105773,8.647825"
}

node 'suretec01' inherits ringnode {
    $owner = "suretec"
    $location = "51.511467,-0.001224"
}

node 'cloudnl01' inherits ringnode {
    $owner = "cloudnl"
    $location = "52.343984,4.828712"
}

node 'icanndns01' inherits ringnode {
    $owner = "icanndns"
    $location = "33.926077,-118.394123"
}

node 'icanndns02' inherits ringnode {
    $owner = "icanndns"
    $location = "38.9507382,-77.3639041"
}

node 'dacor01' inherits ringnode {
    $owner = "dacor"
    $location = "50.25406,10.96146"
}

node 'networkoperations01' inherits ringnode {
    $owner = "networkoperations"
    $location = "53.205139,5.765333"
}

node 'blizoo01' inherits ringnode {
    $owner = "blizoo"
    $location = "42.6588705,23.3482014"
}

node 'vibe01' inherits ringnode {
    $owner = "vibe"
    $location = "-36.849346,174.765412"
}

node 'atw01' inherits ringnode {
    $owner = "atw"
    $location = "47.517702,19.058264"
}

node 'onlinesas01' inherits ringnode {
    $owner = "onlinesas"
    $location = "48.774881,2.380689"
}

node 'citynetwork02' inherits ringnode {
    $owner = "citynetwork"
    $location = "59.422471,17.918073"
}

node 'citynetwork03' inherits ringnode {
    $owner = "citynetwork"
    $location = "51.520251,-0.071555"
}

node 'hibernia03' inherits ringnode {
    $owner = "hibernia"
    $location = "48.86987,2.34424"
}

node 'redpilllinpro02' inherits ringnode {
    $owner = "redpilllinpro"
    $location = "59.949443,10.771563"
}

node 'redpilllinpro03' inherits ringnode {
    $owner = "redpilllinpro"
    $location = "59.305445,13.537273"
}

node 'mainloop01' inherits ringnode {
    $owner = "mainloop"
    $location = "59.422474,17.918095"
}

node 'tigron01' inherits ringnode {
    $owner = "tigron"
    $location = "50.887383,4.455481"
}

node 'nexiu01' inherits ringnode {
    $owner = "nexiu"
    $location = "50.1192924,8.7355652"
}

node 'digitalocean01' inherits ringnode {
    $owner = "digitalocean"
    $location = "51.521187,-0.62416"
}

node 'digitalocean02' inherits ringnode {
    $owner = "digitalocean"
    $location = "1.321075,103.695026"
}

node 'digitalocean03' inherits ringnode {
    $owner = "digitalocean"
    $location = "52.356156,4.955187"
}

node 'digitalocean04' inherits ringnode {
    $owner = "digitalocean"
    $location = "40.82993,-74.126728"
}

node 'bdhub01' inherits ringnode {
    $owner = "bdhub"
    $location = "23.7805838,90.4162568"
}

node 'blacknight01' inherits ringnode {
    $owner = "blacknight"
    $location = "53.34981,-6.26031"
}

node 'globalways01' inherits ringnode {
    $owner = "globalways"
    $location = "48.77488,9.17601"
}

node 'dfn01' inherits ringnode {
    $owner = "dfn"
    $location = "49.5738,11.0272"
}

node 'liquidweb01' inherits ringnode {
    $owner = "liquidweb"
    $location = "42.705619,-84.666429"
}

node 'riseup01' inherits ringnode {
    $owner = "riseup"
    $location = "47.614353,-122.338864"
}

node 'ntt02' inherits ringnode {
    $owner = "ntt"
    $location = "52.30309,4.93795"
}

node 'amazon09' inherits ringnode {
    $owner = "amazon"
    $location = "50.11092,8.68213"
}

node 'immense01' inherits ringnode {
    $owner = "immense"
    $location = "30.45229,-91.11560"
}

node 'bchnetwork01' inherits ringnode {
    $owner = "bchnetwork"
    $location = "50.881702,4.453926"
}

node 'cesnet01' inherits ringnode {
    $owner = "cesnet"
    $location = "50.101886,14.39173"
}

node 'adix01' inherits ringnode {
    $owner = "adix"
    $location = "53.2459559,6.5280274"
}

node 'sasag01' inherits ringnode {
    $owner = "sasag"
    $location = "47.6933420,8.6294460"
}

node 'ovh01' inherits ringnode {
    $owner = "ovh"
    $location = "50.98707,2.12554"
}

node 'btireland01' inherits ringnode {
    $owner = "btireland"
    $location = "53.291844,-6.415470"
}

node 'larsendata01' inherits ringnode {
    $owner = "larsendata"
    $location = "55.728018,12.380919"
}

node 'firstcolo01' inherits ringnode {
    $owner = "firstcolo"
    $location = "50.11648,8.72594"
}

node 'tumuenchen01' inherits ringnode {
    $owner = "tumuenchen"
    $location = "48.262413,11.668332"
}

node 'kudelski01' inherits ringnode {
    $owner = "kudelski"
    $location = "47.387975,8.520295"
}

node 'csuc01' inherits ringnode {
    $owner = "csuc"
    $location = "41.387549,2.111557"
}

node 'qcom01' inherits ringnode {
    $owner = "qcom"
    $location = "45.67361,9.67697"
}

node 'jointtransit01' inherits ringnode {
    $owner = "jointtransit"
    $location = "52.34398,4.82871"
}

node 'edsitech01' inherits ringnode {
    $owner = "edsitech"
    $location = "46.522611,6.63314"
}

node '1oconsulting01' inherits ringnode {
    $owner = "1oconsulting"
    $location = "59.290854,18.017407"
}

node 'datacentred01' inherits ringnode {
    $owner = "datacentred"
    $location = "53.475316,-2.294012"
}

node 'ovh02' inherits ringnode {
    $owner = "ovh"
    $location = "50.69265,3.20153"
}

node 'ovh03' inherits ringnode {
    $owner = "ovh"
    $location = "48.57341,7.75211"
}

node 'ovh04' inherits ringnode {
    $owner = "ovh"
    $location = "45.3150817,-73.8779033"
}

node 'vshn01' inherits ringnode {
    $owner = "vshn"
    $location = "47.45008,8.53988"
}

node 'queryfoundry01' inherits ringnode {
    $owner = "queryfoundry"
    $location = "34.048164,-118.255697"
}

node 'globalconnect01' inherits ringnode {
    $owner = "globalconnect"
    $location = "55.662103,12.301349"
}

node 'openit01' inherits ringnode {
    $owner = "openit"
    $location = "51.188409,6.866153"
}

node 'fidonet01' inherits ringnode {
    $owner = "fidonet"
    $location = "51.515099,0.001794"
}

node 'atechmedia01' inherits ringnode {
    $owner = "atechmedia"
    $location = "51.5681242,-0.2309344"
}

node 'cablecom01' inherits ringnode {
    $owner = "cablecom"
    $location = "51.50735,-0.12776"
}

node 'maxitel02' inherits ringnode {
    $owner = "maxitel"
    $location = "52.07050,4.30070"
}

node 'netnod01' inherits ringnode {
    $owner = "netnod"
    $location = "59.339511,18.0132642"
}

node 'quadranet01' inherits ringnode {
    $owner = "quadranet"
    $location = "34.04842,-118.25521"
}

node 'xfernet01' inherits ringnode {
    $owner = "xfernet"
    $location = "34.0611957,-118.2916508"
}

node 'speakup01' inherits ringnode {
    $owner = "speakup"
    $location = "52.237143,6.849456"
}

node 'dna01' inherits ringnode {
    $owner = "dna"
    $location = "60.2944104,24.9283004"
}

node 'leaseweb02' inherits ringnode {
    $owner = "leaseweb"
    $location = "52.391224,4.665155"
}

node 'leaseweb03' inherits ringnode {
    $owner = "leaseweb"
    $location = "38.746461,-77.533079"
}

node 'leaseweb04' inherits ringnode {
    $owner = "leaseweb"
    $location = "50.096741,8.629677"
}

node 'tdc01' inherits ringnode {
    $owner = "tdc"
    $location = "56.162938,10.203917"
}

node 'nicbr01' inherits ringnode {
    $owner = "nicbr"
    $location = "-23.500348,-46.842800"
}

node 'exnetworks01' inherits ringnode {
    $owner = "exnetworks"
    $location = "51.511122,-0.003533"
}

node 'sggs01' inherits ringnode {
    $owner = "sggs"
    $location = "1.351141,103.862008"
}

node 'peakten01' inherits ringnode {
    $owner = "peakten"
    $location = "38.254167,85.759167"
}

node 'vshn02' inherits ringnode {
    $owner = "vshn"
    $location = "47.432913,8.557448"
}

node 'nianet01' inherits ringnode {
    $owner = "nianet"
    $location = "56.07,9.993083"
}

node 'pix01' inherits ringnode {
    $owner = "pix"
    $location = "31.90707,35.20627"
}

node 'utwente01' inherits ringnode {
    $owner = "utwente"
    $location = "52.2397661,6.8535898"
}

node 'transtelco01' inherits ringnode {
    $owner = "transtelco"
    $location = "31.7333,-106.4833"
}

node 'lwlcom01' inherits ringnode {
    $owner = "lwlcom"
    $location = "53.11066,8.76517"
}

node 'ucsc01' inherits ringnode {
    $owner = "ucsc"
    $location = "37.0000,122.0600"
}

node 'nordunet01' inherits ringnode {
    $owner = "nordunet"
    $location = "59.341984,18.062366"
}

node 'bkkfiber01' inherits ringnode {
    $owner = "bkkfiber"
    $location = "60.3731,5.3392"
}

node 'cloudcenter01' inherits ringnode {
    $owner = "cloudcenter"
    $location = "61.496,23.757"
}

node 'cloudvps01' inherits ringnode {
    $owner = "cloudvps"
    $location = "52.332912,4.919461"
}

node 'veracity01' inherits ringnode {
    $owner = "veracity"
    $location = "40.479904,-111.904475"
}

node 'vellance01' inherits ringnode {
    $owner = "vellance"
    $location = "52.332794,4.919612"
}

node 'cegeka01' inherits ringnode {
    $owner = "cegeka"
    $location = "50.930698,5.370075799999995"
}

node 'choopa01' inherits ringnode {
    $owner = "choopa"
    $location = "40.556947,-74.484737"
}

node 'upcloud01' inherits ringnode {
    $owner = "upcloud"
    $location = "60.173324,24.941025"
}

node 'elisa01' inherits ringnode {
    $owner = "elisa"
    $location = "60.197486,24.936639"
}

node 'corebackbone01' inherits ringnode {
    $owner = "corebackbone"
    $location = "49.4539333,11.0636334"
}

node 'linode01' inherits ringnode {
    $owner = "linode"
    $location = "1.324256,103.891800"
}

node 'openimp01' inherits ringnode {
    $owner = "openimp"
    $location = "51.521259,-0.071998"
}

node 'swiftnode01' inherits ringnode {
    $owner = "swiftnode"
    $location = "34.047539,-118.256699"
}

node 'fusix01' inherits ringnode {
    $owner = "fusix"
    $location = "52.303941,4.939339"
}

node 'exanetworks01' inherits ringnode {
    $owner = "exanetworks"
    $location = "53.4644732,-2.2475544000000127"
}

node 'gigabit01' inherits ringnode {
    $owner = "gigabit"
    $location = "55.72760,12.37716"
}

node 'altibox01' inherits ringnode {
    $owner = "altibox"
    $location = "58.934157,5.740233"
}

node 'zitcom01' inherits ringnode {
    $owner = "zitcom"
    $location = "56.052986,9.950799"
}

node 'bytemark01' inherits ringnode {
    $owner = "bytemark"
    $location = "53.980114,-1.130090999999993"
}

node 'call2701' inherits ringnode {
    $owner = "call27"
    $location = "54.960979,-1.631978"
}

node 'iptron01' inherits ringnode {
    $owner = "iptron"
    $location = "59.436219,24.704990"
}

node 'euronet01' inherits ringnode {
    $owner = "euronet"
    $location = "52.345587,4.832434"
}

node 'ism01' inherits ringnode {
    $owner = "ism"
    $location = "52.40034381020145,4.843141436576843"
}

node 'sonic01' inherits ringnode {
    $owner = "sonic"
    $location = "38.419232,-122.751613"
}

node 'sabay01' inherits ringnode {
    $owner = "sabay"
    $location = "11.55810,104.92039"
}

node 'coreinternet01' inherits ringnode {
    $owner = "coreinternet"
    $location = "50.848180,-1.166411"
}

node 'upcloud02' inherits ringnode {
    $owner = "upcloud"
    $location = "50.097852,8.689811"
}

node 'upcloud03' inherits ringnode {
    $owner = "upcloud"
    $location = "51.512431,-0.107398"
}

node 'upcloud04' inherits ringnode {
    $owner = "upcloud"
    $location = "41.862632,-87.666924"
}

node 'teleweb01' inherits ringnode {
    $owner = "teleweb"
    $location = "51.120123,4.017047"
}

node 'tfskok01' inherits ringnode {
    $owner = "tfskok"
    $location = "54.489418,18.545387"
}

node 'mtwentyfourseven01' inherits ringnode {
    $owner = "mtwentyfourseven"
    $location = "53.4614821,-2.3244391"
}

node 'peakten02' inherits ringnode {
    $owner = "peakten"
    $location = "35.2269,-80.8433"
}

node 'peakten03' inherits ringnode {
    $owner = "peakten"
    $location = "36.1667,-86.7833"
}

node 'switchco01' inherits ringnode {
    $owner = "switchco"
    $location = "52.354626,4.961590"
}

node 'nodesdirect01' inherits ringnode {
    $owner = "nodesdirect"
    $location = "30.331446,-81.662439"
}

node 'quanza01' inherits ringnode {
    $owner = "quanza"
    $location = "52.332872,4.919522"
}

node 'fasttrackcomm01' inherits ringnode {
    $owner = "fasttrackcomm"
    $location = "37.243937,-107.874365"
}

node 'amatis01' inherits ringnode {
    $owner = "amatis"
    $location = "51.46214,-1.00757"
}

node 'gwu01' inherits ringnode {
    $owner = "gwu"
    $location = "38.897575,-77.048053"
}

node 'communityrack01' inherits ringnode {
    $owner = "communityrack"
    $location = "47.383398,8.495548"
}

node 'surfnet02' inherits ringnode {
    $owner = "surfnet"
    $location = "52.087963,5.167554"
}

node 'vibe02' inherits ringnode {
    $owner = "vibe"
    $location = "-33.869786,151.21911"
}

node 'rackcentral01' inherits ringnode {
    $owner = "rackcentral"
    $location = "-37.8227346,144.9321503"
}

node 'rackcentral02' inherits ringnode {
    $owner = "rackcentral"
    $location = "-37.8227346,144.9321503"
}

node 'widenet01' inherits ringnode {
    $owner = "widenet"
    $location = "49.4297,22.5867"
}

node 'viatel04' inherits ringnode {
    $owner = "viatel"
    $location = "52.293529,4.945530"
}

node 'dhiraagu01' inherits ringnode {
    $owner = "dhiraagu"
    $location = "4.166667,73.5"
}

node 'vivor01' inherits ringnode {
    $owner = "vivor"
    $location = "52.027374,5.624321"
}

node 'comcast01' inherits ringnode {
    $owner = "comcast"
    $location = "41.919639N,-87.912075"
}

node 'seltimil01' inherits ringnode {
    $owner = "seltimil"
    $location = "62.240889,25.751528"
}

node 'amazon10' inherits ringnode {
    $owner = "amazon"
    $location = "39.9075000,116.3972300"
}

node 'intermax01' inherits ringnode {
    $owner = "intermax"
    $location = "51.930219,4.413842"
}

node 'staging01' inherits ringnode {
    $owner = "test"
}

node 'pbwcomm01' inherits ringnode {
    $owner = "pbwcomm"
    $location = "38.9626498,-77.3802991"
}

node 'amazon11' inherits ringnode {
    $owner = "amazon"
    $location = "37.56654,126.97797"
}

node 'peakten04' inherits ringnode {
    $owner = "peakten"
    $location = "33.93341,-84.21638"
}

node 'kit01' inherits ringnode {
    $owner = "kit"
    $location = "49.01222,8.40815"
}

node 'inxza01' inherits ringnode {
    $owner = "inxza"
    $location = "-26.146743,28.036484"
}

node '23media01' inherits ringnode {
    $owner = "23media"
    $location = "50.096114,8.628441"
}

node 'anuragbhatia01' {
    include salt
    include users::virtual::ring_admins
    include cronjobs
    include nettools
    include etcfiles
    include local_binaries

    $postfix_smtp_listen = "127.0.0.1"
    $root_mail_recipient = "ring-admins@ring.nlnog.net"
    $postfix_myorigin = ""
    include postfix
    include resolving
    include no-apache2
    include syslog_ng::client
    include nodesonlycron

    $owner = "anuragbhatia"
    $location = "28.895515,76.606611"
    include set_local_settings                                                  
}

node 'elite01' inherits ringnode {
    $owner = "elite"
    $location = "51.523418,-0.100464"
}

node 'lbl01' inherits ringnode {
    $owner = "lbl"
    $location = "37.8768,-122.2527"
}

node 'keklolwtf01' inherits ringnode {
    $owner = "keklolwtf"
    $location = "60.274066,5.236390"
}

node 'cadence01' inherits ringnode {
    $owner = "cadence"
    $location = "51.494693919764615,-0.01836619339883"
}

node 'sigtelecom01' inherits ringnode {
    $owner = "sigtelecom"
    $location = "46.20701984544142,6.1044421792030334"
}

node 'linode02' inherits ringnode {
    $owner = "linode"
    $location = "50.096751,8.644020"
}

node 'linode03' inherits ringnode {
    $owner = "linode"
    $location = "40.831821,-74.448794"
}

node 'datapath01' inherits ringnode {
    $owner = "datapath"
    $location = "50.128587,8.580335"
}

node 'zerofail01' inherits ringnode {
    $owner = "zerofail"
    $location = "45.467049,-73.541176"
}

node 'fiberby01' inherits ringnode {
    $owner = "fiberby"
    $location = "55.66943,12.53909"
}

node 'serversaustralia01' inherits ringnode {
    $owner = "serversaustralia"
    $location = "-33.921638,151.188263"
}

node 'chaosdarmstadt01' inherits ringnode {
    $owner = "chaosdarmstadt"
    $location = "49.877636,8.654469"
}

node 'plurimedia01' inherits ringnode {
    $owner = "plurimedia"
    $location = "48.5839200,7.7455300"
}

node 'digitalocean05' inherits ringnode {
    $owner = "digitalocean"
    $location = "12.843064,77.656476"
}

node 'midcore01' inherits ringnode {
    $owner = "midcore"
    $location = "52.278519,-1.895536"
}

node 'clouddk01' inherits ringnode {
    $owner = "clouddk"
    $location = "55.662101,12.30134499999997"
}

node 'deic01' inherits ringnode {
    $owner = "deic"
    $location = "55.784497,12.519332"
}

node 'netcup01' inherits ringnode {
    $owner = "netcup"
    $location = "49.456373,11.078364"
}

node 'hostwayde01' inherits ringnode {
    $owner = "hostwayde"
    $location = "52.328409,9.783299"
}

node 'dreamhack01' inherits ringnode {
    $owner = "dreamhack"
    $location = "59.407410,17.835249"
}

node 'memset01' inherits ringnode {
    $owner = "memset"
    $location = "51.427652,-0.978997"
}

node 'hkserverworks01' inherits ringnode {
    $owner = "hkserverworks"
    $location = "22.373888888888888,114.1083888888888"
}

node 'plutex01' inherits ringnode {
    $owner = "plutex"
    $location = "53.0761418,8.7716442"
}

node 'pcextreme02' inherits ringnode {
    $owner = "pcextreme"
    $location = "52.4007,4.8433"
}

node 'pcextreme03' inherits ringnode {
    $owner = "pcextreme"
    $location = "52.303823,4.939355"
}

node 'pcextreme04' inherits ringnode {
    $owner = "pcextreme"
    $location = "35.6638546,139.81218279999996"
}

node 'pcextreme05' inherits ringnode {
    $owner = "pcextreme"
    $location = "25.7758255,-80.1928077"
}

node 'pcextreme06' inherits ringnode {
    $owner = "pcextreme"
    $location = "34.0276254,-118.23907750000001"
}

node 'metapeer01' inherits ringnode {
    $owner = "metapeer"
    $location = "47.4923372,-122.2923814"
}

node 'hextet01' inherits ringnode {
    $owner = "hextet"
    $location = "49.8936072,-97.1451288"
}

node 'amazon12' inherits ringnode {
    $owner = "amazon"
    $location = "19.07598,72.87766"
}

node 'ekmedia01' inherits ringnode {
    $owner = "ekmedia"
    $location = "51.988367,4.382284"
}

node 'fundaments01' inherits ringnode {
    $owner = "fundaments"
    $location = "52.281142,4.765655"
}

node 'patientsky01' inherits ringnode {
    $owner = "patientsky"
    $location = "59.8274477,10.795041099999935"
}

node 'xantaro01' inherits ringnode {
    $owner = "xantaro"
    $location = "50.083242,8.633570"
}

node 'linode04' inherits ringnode {
    $owner = "linode"
    $location = "32.791539,-96.815154"
}

node 'linode05' inherits ringnode {
    $owner = "linode"
    $location = "37.471628,-121.919837"
}

node 'linode06' inherits ringnode {
    $owner = "linode"
    $location = "33.733902,-84.425719"
}

node 'linode07' inherits ringnode {
    $owner = "linode"
    $location = "51.531654,-0.257503"
}

node 'novoserve01' inherits ringnode {
    $owner = "novoserve"
    $location = "51.9542499,6.3004314"
}

node 'cvo01' inherits ringnode {
    $owner = "cvo"
    $location = "51.8459434,4.679178399999955"
}

node 'plusline01' inherits ringnode {
    $owner = "plusline"
    $location = "50.119871,8.735244"
}

node 'kviknet01' inherits ringnode {
    $owner = "kviknet"
    $location = "55.662101,12.2991563"
}

node 'liquidtelecom01' inherits ringnode {
    $owner = "liquidtelecom"
    $location = "-17.8319711,31.0519865"
}
node 'liquidtelecom02' inherits ringnode {
    $owner = "liquidtelecom"
    $location = "-1.3281445,36.8644586"
}
node 'carnet01' inherits ringnode {
    $owner = "carnet"
    $location = "45.6517742,15.6600504"
}
node 'internode01' inherits ringnode {
    $owner = "internode"
    $location = "-34.923786,138.607016"
}
node 'depaul01' inherits ringnode {
    $owner = "depaul"
    $location = "41.878439,-87.625586"
}
node 'custodian01' inherits ringnode {
    $owner = "custodian"
    $location = "51.2796973,0.5490267"
}
node 'hibernia02' inherits ringnode {
    $owner = "hibernia"
    $location = "40.717884,-74.008938"
}
node 'franceix01' inherits ringnode {
    $owner = "franceix"
    $location = "48.914245,2.362260"
}
node 'netrouting01' inherits ringnode {
    $owner = "netrouting"
    $location = "51.8556047,4.301611800000046"
}
node 'liteserver01' inherits ringnode {
    $owner = "liteserver"
    $location = "52.543863,5.705141"
}
node '20c01' inherits ringnode {
    $owner = "20c"
    $location = "41.875998,-88.248779"
}
node 'netrouting02' inherits ringnode {
    $owner = "netrouting"
    $location = "51.8556047,4.301611800000046"
}
node 'connectria01' inherits ringnode {
    $owner = "connectria"
    $location = "38.629332,-90.197304"
}
node 'syseleven02' inherits ringnode {
    $owner = "syseleven"
    $location = "50.120542,8.736711"
}
node 'freifunkrl01' inherits ringnode {
    $owner = "freifunkrl"
    $location = "52.4658322,13.3696673"
}
node 'svwh01' inherits ringnode {
    $owner = "svwh"
    $location = "37.334321,-121.891560"
}
node 'kampde01' inherits ringnode {
    $owner = "kampde"
    $location = "51.505620,6.871258"
}
