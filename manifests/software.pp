class master_software {
    package { "libactiverecord-ruby1.8": ensure => present }
    package { "libsqlite3-ruby1.8": ensure => present }
    package { "sqlite3": ensure => present }
    package { "libactivesupport-ruby1.8": ensure => present }
    package { "rails": ensure => present }
    package { "apache2": ensure => present }
    package { "mysql-server": ensure => present }
    package { "libmysql-ruby": ensure => present }
}

class nettools {
    package { "openntpd": ensure => present }
    package { "python-setuptools": ensure => present }
    package { "sl": ensure => present }
    package { "mtr": ensure => present }
    package { "traceroute": ensure => present }
    package { "fail2ban": ensure => present }
    package { "tcpdump": ensure => present }
    package { "build-essential": ensure => present }
    package { "dnsutils": ensure => present }
    package { "iputils-tracepath": ensure => present }
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
    package { "bsd-mailx": ensure => present }
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
    package { "tmux": ensure => present }
    package { "screen": ensure => present }
    package { "ucspi-tcp": ensure => present }
    package { "fping": ensure => present }
    package { "update-manager-core": ensure => present }
    package { "man-db": ensure => present }
 
    # packages we don't like
    package { "pppoe": ensure => purged }
    package { "ppp": ensure => purged }
    package { "dhcp3-client": ensure => purged }
    package { "dhcp3-common": ensure => purged }
    package { "pppconfig": ensure => purged }
    package { "pppoeconfig": ensure => purged }
    package { "resolvconf": ensure => purged }
}
