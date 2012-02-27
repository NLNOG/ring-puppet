# Class: master_software
#
class master_software {
    package { "libactiverecord-ruby1.8": ensure => present }
    package { "libsqlite3-ruby1.8": ensure => present }
    package { "sqlite3": ensure => present }
    package { "libactivesupport-ruby1.8": ensure => present }
    package { "rails": ensure => present }
    package { "mysql-server": ensure => present }
    package { "libmysql-ruby": ensure => present }
    package { "puppetmaster": ensure => latest }
    package { "etckeeper": ensure => present }
    package { "puppetmaster-common": ensure => latest }
    package { "apache2-mpm-prefork": ensure => latest }
}

class nettools {
    package { "bash-completion":
        ensure => latest,
    }
    package { "update-motd":
        ensure => present,
    }
    package { "iperf":
        ensure => present,
    }
    package { "scamper":
        ensure => latest,
    }
    package { ["iputils-ping", "iputils-tracepath"]:
        ensure => latest,
    }
    package { "lft": ensure => present }
    file { "/usr/bin/lft":
        ensure => "/usr/sbin/lft",
        require => [Package["lft"]],
    }
    file { "/usr/sbin/lft":
        mode    => "4755",
        require => [Package["lft"]],
    }

    package { "libnet-ssh2-ruby1.8": ensure => present }
    package { "puppet": ensure => latest }
    package { "puppet-common": ensure => latest }
    package { "python-dnspython": ensure => present }
    package { "python-argparse": ensure => present }
    package { "python-ipaddr": ensure => present }
    package { "graphviz": ensure => present }
    package { "hping3": ensure => latest }
    exec { "setcap cap_net_raw,cap_net_admin=eip /usr/sbin/hping3":
        onlyif  => "/usr/bin/test \"`/sbin/getcap /usr/sbin/hping3`\" != \"/usr/sbin/hping3 = cap_net_admin,cap_net_raw+eip\"",
        require => Package["hping3"],
    }
 
    package { "openntpd": ensure => purged }
    package { "ntp": ensure => latest }
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
    package { "python-setuptools": ensure => present }
    package { "virt-what": ensure => present }
    package { "sl": ensure => present }
    package { "mtr": ensure => latest }
    package { "nmap": ensure => latest }
    package { "traceroute": ensure => present }
    
    package { "tcpdump": ensure => present }
    package { "libcap2-bin": ensure => present }
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
    
    package { "tshark": ensure => present }
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
        require => Package["tshark"],
    }

    package { "build-essential": ensure => present }
    package { "dnsutils": ensure => present }
    package { "wget": ensure => present }
    # the following package will need some work before it can function
    package { "traceroute-nanog": ensure => present }
    # here we set the suid bit for the nanog traceroute program
    file { "/usr/bin/traceroute-nanog.genuine":
        mode    => "4755",
        recurse => false
    }
    package { "netcat-openbsd": ensure => present }
    package { "ngrep": ensure => present }
    package { "netsed": ensure => present }
    package { "git-core": ensure => present }
    package { "mercurial": ensure => present }
    package { "w3m": ensure => present }
    package { "curl": ensure => present }
    package { "bc": ensure => present }
    package { "dbndns": ensure => present }
    package { "bind9-host": ensure => present }
    package { "bzr": ensure => present }
    package { "cvs": ensure => present }
    package { "dsniff": ensure => present }
    package { "fpdns": ensure => present }
    package { "gnupg": ensure => present }
    package { "ipcalc": ensure => present }
    package { "sipcalc": ensure => present }
    package { "lftp": ensure => present }
    package { "python": ensure => present }
    package { "ruby": ensure => present }
    package { "lynx": ensure => present }
    package { "php5-cli": ensure => present }
    package { "pv": ensure => present }
    package { "rsync": ensure => present }
    package { "strace": ensure => present }
    package { "lsof": ensure => present }
    package { "ltrace": ensure => present }
    package { "tcptraceroute": ensure => present }
    package { "ndisc6": ensure => present }
    package { "tmux": ensure => present }
    package { "screen": ensure => present }
    package { "ucspi-tcp": ensure => present }
    package { "fping": ensure => present }
    package { "update-manager-core": ensure => present }
    package { "man-db": ensure => present }
    package { "landscape-common": ensure => present }
    package { "unattended-upgrades": ensure => present }
    package { "update-notifier-common": ensure => present }
    package { "pastebinit": ensure => present }
    package { "markdown": ensure => present }
    package { "vim": ensure => present }

    # packages we don't like
    package { "pppoe": ensure => purged }
    package { "ppp": ensure => purged }
    package { "pppconfig": ensure => purged }
    package { "pppoeconfig": ensure => purged }
    package { "resolvconf": ensure => purged }
    package { "ferm": ensure => purged }
    package { "ufw": ensure => purged }
    package { "apparmor": ensure => purged }
    package { "apparmor-utils": ensure => purged }
    define dhcp ( $present = "purged" ) {                                       
        package { ["dhcp3-client", "dhcp3-common"]:                             
            ensure  => $present,                                                
        }                                                                       
    }
    dhcp { install_dhcp:
    }
}

class nlnogrepokey {

  file { "/etc/apt/nlnogrepopublic.key":
    mode   => 440,
    owner  => root,
    group  => root,
    source => [
        "puppet:///files/etc/apt/nlnogrepopublic.key"
        ],
  }
  exec { "install-key":
     command => "/usr/bin/apt-key add /etc/apt/nlnogrepopublic.key",
     require => File["/etc/apt/nlnogrepopublic.key"],
     unless  => "/usr/bin/apt-key list | /bin/grep -q 'ring-admins@ring.nlnog.net'";
  }
#  exec { "key-update":
#     command => "/usr/bin/apt-get update",
#     require => Exec["install-key"],
#  }
}

