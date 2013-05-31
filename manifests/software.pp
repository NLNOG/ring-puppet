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
    package { "apache2-mpm-prefork": ensure => latest }
}

class nettools {
    # for BGPmon stuff (requested by dave) 
    package { "libxml2-dev": ensure => latest }
    package { "python-libxml2": ensure => latest }
    package { "socat": ensure => latest }

    # debugging stuff
    package { ["htop", "sysstat", "iotop"]: ensure => latest }

    package { "libcache-cache-perl": ensure => latest }
    package { "httping": ensure => latest }

    # requested by teun
    package { ["python-beautifulsoup", "python-flask"]:
        ensure => latest,
    }

    # requested by teun
    package { ["snmp"]:
        ensure => latest,
    }

    package { "command-not-found":
        ensure => latest,
    }
    package { "telnet":
        ensure  => latest,
    }
    package { "python-software-properties":
        ensure  => latest,
    }
    package { "python-pycountry":
        ensure  => latest,
    }
    package { "psmisc":
        ensure => latest,
    }
    package { "whois":
        ensure  => latest,
    }
   package { "bash-completion":
        ensure => latest,
    }
    package { "update-motd":
        ensure => latest,
    }
    package { "iperf":
        ensure => latest,
    }
    package { "scamper":
        ensure => latest,
    }
    package { ["iputils-ping", "iputils-tracepath"]:
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

    package { "libnet-ssh2-ruby1.8": ensure => latest }
    package { "puppet": ensure => latest }
    package { "puppet-common": ensure => latest }
    package { "python-dnspython": ensure => latest }
    package { "python-argparse": 
        ensure => $lsbdistcodename ? {
            maverick    => latest,
            precise     => absent,
        }
    }
    package { "python-ipaddr": ensure => latest }
    package { "graphviz": ensure => latest }
    package { "hping3": ensure => latest }
    package { "gnutls-bin": ensure => latest }
    exec { "setcap cap_net_raw,cap_net_admin=eip /usr/sbin/hping3":
        onlyif  => "/usr/bin/test \"`/sbin/getcap /usr/sbin/hping3`\" != \"/usr/sbin/hping3 = cap_net_admin,cap_net_raw+eip\"",
        require => Package["hping3", "libcap2-bin"],
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
    package { "python-setuptools": ensure => latest }
    package { "virt-what": ensure => latest }
    package { "sl": ensure => purged }
    package { "mtr": ensure => latest}
    package { "nmap": ensure => latest }
    package { "traceroute": ensure => latest }
    
    package { "python-mysqldb": ensure => latest }

    exec { "setcap cap_net_raw+ep /usr/bin/traceroute.db":
        onlyif  => "/usr/bin/test \"`/sbin/getcap /usr/bin/traceroute.db`\" != \"/usr/bin/traceroute.db = cap_net_raw+ep\"",
        require => Package["traceroute", "libcap2-bin"],
    }
#    exec { "setcap cap_net_raw+ep /usr/bin/traceroute6":
#        onlyif  => "/usr/bin/test \"`/sbin/getcap /usr/bin/traceroute6`\" != \"/usr/bin/traceroute6 = cap_net_raw+eip\"",
#        require => Package["traceroute"],
#    }


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

    package { "build-essential": ensure => latest }
    package { ["bison", "flex"]: ensure => latest }
    package { "dnsutils": ensure => latest }
    package { "ldnsutils": ensure => latest }
    package { "wget": ensure => latest }
    package { "netcat-openbsd": ensure => latest }
    package { "ngrep": ensure => latest }
    package { "netsed": ensure => latest }
    package { "git-core": ensure => latest }
    package { "mercurial": ensure => latest }
    package { "w3m": ensure => latest }
    package { "curl": ensure => latest }
    package { "bc": ensure => latest }
    package { "dbndns": ensure => latest }
    package { "bind9-host": ensure => latest }
    package { "bzr": ensure => latest }
    package { "cvs": ensure => latest }
    package { "dsniff": ensure => latest }
    package { "fpdns": ensure => latest }
    package { "gnupg": ensure => latest }
    package { "ipcalc": ensure => latest }
    package { "sipcalc": ensure => latest }
    package { "lftp": ensure => latest }
    package { "python": ensure => latest }
    package { "ruby": ensure => latest }
    package { "lynx": ensure => latest }
    package { "php5-cli": ensure => latest }
    package { "pv": ensure => latest }
    package { "rsync": ensure => latest }
    package { "strace": ensure => latest }
    package { "lsof": ensure => latest }
    package { "ltrace": ensure => latest }
    package { "tcptraceroute": ensure => latest }
    package { "ndisc6": ensure => latest }
    package { "tmux": ensure => latest }
    package { "screen": ensure => latest }
    package { "ucspi-tcp": ensure => latest }
    package { "fping": ensure => latest }
    package { "update-manager-core": ensure => latest }
    package { "man-db": ensure => latest }
    package { "landscape-common": ensure => latest }
    package { "unattended-upgrades": ensure => latest }
    package { "update-notifier-common": ensure => latest }
    package { "pastebinit": ensure => latest }
    package { "markdown": ensure => latest }
    package { "vim": ensure => latest }
    package { "language-pack-en-base": ensure => latest }
    package { "sshfp": ensure => latest }

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

