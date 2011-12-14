# Class fail2ban-whitelist
#
class fail2ban-whitelist {

    package { "fail2ban": ensure => present }

    file { "/etc/fail2ban/jail.local":
        require => Package["fail2ban"],
        subscribe => File["/etc/hosts"],
        alias => "create_jail_local",
        content => template("fail2ban-jail.local.erb"),
    }

    service { fail2ban:
        ensure => running,
        subscribe => File["create_jail_local"]
    }

}
