define add_user($email,$company,$uid,$groups) {

    $username = $title
    $admingroup = "admin"
    $allgroups = $groups

#    @@nagios_contact { $username:
#        alias => $company,
#        contact_name => $username,
#        email => $email,
#        use => "generic-contact",
#    }

    user { $username:
        comment => "${company} - ${email}",
        home    => "/home/$username",
        shell   => "/bin/bash",
        uid     => $uid,
        groups  => $allgroups
    }
 
    group { $username:
        gid     => $uid,
        require => User[$username]
    }
    
    file { "/home/$username/":
        ensure  => directory,
        owner   => $username,
        group   => $username,
        mode    => 700,
        require => [ User[$username], Group[$username] ]
    }
             
    file { "/home/$username/.ssh":
        ensure  => directory,
        owner   => $username,
        group   => $username,
        mode    => 700,
        require => File["/home/$username/"]
    }
 
    file { "/home/$username/.ssh/authorized_keys":
        ensure  => present,
        owner   => $username,
        group   => $username,
        mode    => 600,
        require => File["/home/$username/"]
    }
}

define add_ssh_key($key,$type,$user,$options) {

    $username       = $user
 
    ssh_authorized_key{ "${username}_${key}":
        ensure  => present,
        key     => $key,
        name    => $name,
        type    => $type,
        user    => $username,
        options => $options,
        require => File["/home/$username/.ssh/authorized_keys"]
    }
}

define add_group($gid) {

    $groupname = $title
 
    group { $groupname:
        gid     => $gid,
    }
}
