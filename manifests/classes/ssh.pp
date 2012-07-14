# Class ssh
# this class distributes all ssh host keys to all hosts which include this
# class
#
class ssh {

    file { "/etc/ssh/ssh_known_hosts":
        ensure => present,
        mode => 644,
    }

    # collect a host key as a virtual exported resource
    # we only need DSA and the name + alias are the first
    # two names in /etc/ssh/ssh_known_hosts 
    # which helps tab completition

    # after we upgrade all nodes to ubuntu precise, we can use:       
    # host_aliases => ["${fqdn}", "${ipaddress6}", "${ipaddress}"],
    @@sshkey { 
        "${hostname}": 
            host_aliases => ["${fqdn}", "${ipaddress}", "${ipaddress6}"],
            type => ssh-rsa,
            key => "${sshrsakey}",
            require => File["/etc/ssh/ssh_known_hosts"];

   } 
#        "zrsa-${hostname}": 
#            host_aliases => ["${fqdn}","${hostname}"], 
#            type => ssh-rsa,
#            key => "${sshrsakey}";
 
    # realize all the virtual exported resources
    
    Sshkey <<| |>>

    # remove all ssh host keys that are not managed by puppet
    # this keeps stuff nice and clean

    resources { sshkey:
        purge => true,
    }
}
