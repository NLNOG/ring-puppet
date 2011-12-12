# Class fail2ban-whitelist
#
class fail2ban-whitelist {

    package { "fail2ban": ensure => present }

    exec { "echo -e \"[DEFAULT]\nignoreip = $(grep ^[0-9] /etc/hosts|cut -d' ' -f1|cut -f1|sort -n|grep -v :|tr '\n' ' ')\" > /etc/fail2ban/jail.local":
        cwd => "/etc/fail2ban",
        creates => "/etc/fail2ban/jail.local",
        subscribe => File["/etc/hosts"],
        alias => "create_jail_local",
        require => Package["fail2ban"],
    }

    service { fail2ban:
        ensure => running,
        subscribe => Exec["create_jail_local"]
    }

}
