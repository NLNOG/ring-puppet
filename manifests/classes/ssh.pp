class ssh {
    file { "/etc/ssh/ssh_known_hosts":
        ensure => present,
        mode => 644,
    }

    @@sshkey { 
        "${hostname}-dsa": 
            host_aliases => ["${fqdn}","${hostname}"],
            type => ssh-dss,
            key => "${sshdsakey}";
        "${hostname}-rsa": 
            host_aliases => ["${fqdn}","${hostname}"], 
            type => ssh-rsa,
            key => "${sshrsakey}";
    } 

    Sshkey <<| |>>    
}
