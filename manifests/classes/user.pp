define add_user($email,$company,$uid,$groups,$ensure="present") {

    $username = $title
    $admingroup = "admin"
    $allgroups = $groups

#    @@nagios_contact { $username::
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
        groups  => $allgroups,
        ensure  => $ensure,
    }
 
    group { $username:
        gid     => $uid,
        require => User[$username],
        ensure  => $present,
    }

    if $ensure == 'present {
        file { "/home/$username/":
            ensure  => directory,
            owner   => $username,
            group   => $username,
            mode    => 700,
            require => [ User[$username], Group[$username] ],
        }
    }     

    file { "/home/$username/.ssh":
        ensure  => directory,
        owner   => $username,
        group   => $username,
        mode    => 700,
        require => File["/home/$username/"],
    }
 
    file { "/home/$username/.ssh/authorized_keys":
        owner   => $username,
        group   => $username,
        mode    => 600,
        require => File["/home/$username/"],
        ensure  => $ensure,
    }
}

define add_ssh_key($key,$type,$user,$options,$ensure="present") {

    $username       = $user
 
    ssh_authorized_key{ "${username}_${key}":
        ensure  => $ensure,
        key     => $key,
        name    => $name,
        type    => $type,
        user    => $username,
        options => $options,
        require => File["/home/$username/.ssh/authorized_keys"],
        purge   => true,
    }
}

define add_group($gid) {

    $groupname = $title
 
    group { $groupname:
        gid     => $gid,
    }
}
