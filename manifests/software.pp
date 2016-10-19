# Class: master_software
#
class master_software {
    package { "libactiverecord-ruby1.8": ensure => latest }
    package { "libsqlite3-ruby1.8": ensure => latest }
    package { "sqlite3": ensure => latest }
    package { "libactivesupport-ruby1.8": ensure => latest }
    package { "rails": ensure => latest }
    package { "mysql-server": ensure => latest }
    package { "libmysql-ruby": ensure => latest }
    package { "puppetmaster": ensure => latest }
    package { "etckeeper": ensure => latest }
    package { "puppetmaster-common": ensure => latest }
}

class nettools {
    package { ["iputils-ping"]:
        ensure => latest,
    }

    file { ["/bin/ping", "/bin/ping6"]:
        mode    =>  "4755",
        require =>  Package["iputils-ping"],
    }

    package { "lft": ensure => latest }
    file { "/usr/bin/lft":
        ensure => "/usr/sbin/lft",
        require => [Package["lft"]],
    }
    file { "/usr/sbin/lft":
        mode    => "4755",
        require => [Package["lft"]],
    }

    package { "puppet": ensure => latest }
    package { "puppet-common": ensure => latest }
    package { "hping3": ensure => latest }
    exec { "setcap cap_net_raw,cap_net_admin=eip /usr/sbin/hping3":
        onlyif  => "/usr/bin/test \"`/sbin/getcap /usr/sbin/hping3`\" != \"/usr/sbin/hping3 = cap_net_admin,cap_net_raw+eip\"",
        require => Package["hping3", "libcap2-bin"],
    }
 
    package { "openntpd": ensure => purged }
    package { "ntp": ensure => latest }

    # kelolwtf manages their own ntp
    if ($fqdn != "keklolwtf01.ring.nlnog.net") {
        file { "/etc/ntp.conf":
            require => Package["ntp"],
            mode   => 644,
            owner  => root,
            group  => root,
            source => "puppet:///files/etc/ntp.conf",
          }
        service { "ntp":
            ensure => running,
            subscribe => File["/etc/ntp.conf"],
        }
    }
    package { "sl": ensure => purged }
    package { "mtr": ensure => purged}

    package { "nmap": ensure => latest }
    exec { "setcap cap_net_raw,cap_net_admin=eip /usr/bin/nmap":
        onlyif  => "/usr/bin/test \"`/sbin/getcap /usr/bin/nmap`\" != \"/usr/bin/nmap = cap_net_admin,cap_net_raw+eip\"",
        require => [ Package["nmap"] ],
    }
    exec { "setcap cap_net_raw,cap_net_admin=eip /usr/bin/nping":
        onlyif  => "/usr/bin/test \"`/sbin/getcap /usr/bin/nping`\" != \"/usr/bin/nping = cap_net_admin,cap_net_raw+eip\"",
        require => [ Package["nmap"] ],
    }

    package { "traceroute": ensure => latest }
    exec { "setcap cap_net_raw+ep /usr/bin/traceroute.db":
        onlyif  => "/usr/bin/test \"`/sbin/getcap /usr/bin/traceroute.db`\" != \"/usr/bin/traceroute.db = cap_net_raw+ep\"",
        require => Package["traceroute", "libcap2-bin"],
    }

    package { "tcpdump": ensure => latest }
    package { "libcap2-bin": ensure => latest }
    # here we permit ring-users to use tcpdump
    file { "/usr/sbin/tcpdump":
        mode    => "0755",
        owner   => root,
        group   => ring-users,
        recurse => false,
        require => Package["tcpdump"],
    }
    exec { "setcap cap_net_raw,cap_net_admin=eip /usr/sbin/tcpdump":
        onlyif  => "/usr/bin/test \"`/sbin/getcap /usr/sbin/tcpdump`\" != \"/usr/sbin/tcpdump = cap_net_admin,cap_net_raw+eip\"",
        require => [ Package["libcap2-bin"], Package["tcpdump"] ],
    }
    
    package { "tshark": ensure => latest }
    # here we permit ring-users to use tshark
    file { "/usr/bin/dumpcap":
        mode    => "0754",
        owner   => root,
        group   => ring-users,
        recurse => false,
        require => Package["tshark"],
    }
    exec { "setcap cap_net_admin,cap_net_raw+eip /usr/bin/dumpcap":
        onlyif  => "/usr/bin/test \"`/sbin/getcap /usr/bin/dumpcap`\" != \"/usr/bin/dumpcap = cap_net_admin,cap_net_raw+eip\"",
        require => Package["tshark", "libcap2-bin"],
    }


    package { "update-motd": ensure => latest }
    package { "ruby1.9.3": ensure => latest }
    package { "ruby": ensure => latest }
    package { "members": ensure => latest }
    package { "libsqlite3-dev": ensure => latest }

    # for purgekernels
    package { ["libdpkg-perl", "libgetopt-simple-perl"]: ensure => latest }

    # for ring-curl
    package { ["libjson-perl"]: ensure => latest }
    # Install home-built version for openssl support)
    #package { ["libwww-curl-perl"]: version => '4.15-1build2-ring' }
    package { ["libwww-curl-perl"]: ensure => latest }

    # packages we don't like
    package { ["dhcp3-client", "dhcp3-common"]:
        ensure  => $hostname ? {
            'amazon01'  => latest,
            'amazon02'  => latest,
            'amazon03'  => latest,
            'amazon04'  => latest,
            'amazon05'  => latest,
            'amazon06'  => latest,
            default => purged,
        }
    }
}

class nlnogrepokey {

    apt::key { 'nlnog_ring_repo':
        key     => '37B0CA14',
        key_source  => "https://ring.nlnog.net/nlnogrepopublic.key",
    }

    apt::key { 'salt_repo_key':
        key     => 'DE57BFBE',
        key_source  => "https://repo.saltstack.com/apt/ubuntu/12.04/amd64/latest/SALTSTACK-GPG-KEY.pub",
    }
    
    apt::key { 'ansible_repo_key':
        key     => '7BB9C367',
        key_source  => "https://ring.nlnog.net/ansiblerepopublic.key",
    }

}

