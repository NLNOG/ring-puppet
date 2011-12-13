# Class ssh
#
class ssh {

    file { "/etc/ssh/ssh_known_hosts":
        ensure => present,
        mode => 644,
    }

    @@sshkey { 
        "${hostname}": 
            host_aliases => ["${fqdn}"],
            type => ssh-dss,
            key => "${sshdsakey}",
            require => File["/etc/ssh/ssh_known_hosts"];

        "${hostname}": 
            host_aliases => ["${fqdn}"],
            type => ssh-rsa,
            key => "${sshrsakey}";
    } 

    Sshkey <<| |>>    
}
