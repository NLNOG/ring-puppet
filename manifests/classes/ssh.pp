class ssh {
#    exec { "touch /etc/ssh/ssh_known_hosts":
#        cwd => "/etc/ssh",
#        path => "/usr/bin:/usr/sbin:/bin",
#
#
#    }

    file { "/etc/ssh/ssh_known_hosts":
        ensure => present,
        mode => 644,
    }

    @@sshkey { 
        "${hostname}-dsa": 
            host_aliases => ["${fqdn}","${hostname}"],
            type => ssh-dss,
            key => "${sshdsakey}",
            require => File["/etc/ssh/ssh_known_hosts"];

        "${hostname}-rsa": 
            host_aliases => ["${fqdn}","${hostname}"], 
            type => ssh-rsa,
            key => "${sshrsakey}";
    } 

    Sshkey <<| |>>    
}
