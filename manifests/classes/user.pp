define add_user($email,$company,$uid,$groups,$ensure="present") {

    $username = $title
    $admingroup = "admin"
    $allgroups = $groups

    case $ensure {
        present: {
            $home_owner = $username
            $home_group = $username
        }
        default: {
            $home_owner = "root"
            $group_owner = "root"
        }
    }

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

    file { "/home/$username/":
        ensure  => directory,
        owner   => $home_owner,
        group   => $home_owner,
        mode    => 700,
        require => [ User[$username], Group[$username] ],
    }     

    file { "/home/$username/.ssh":
        ensure  => directory,
        owner   => $home_owner,
        group   => $home_owner,
        mode    => 700,
        require => File["/home/$username/"],
    }
 
    file { "/home/$username/.ssh/authorized_keys":
        owner   => $home_owner,
        group   => $home_owner,
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
    }

#   because of http://projects.reductivelabs.com/issues/1581 this doesnt work
#    resources { "ssh_authorized_key":
#        noop => true,
#        purge => true, 
#    }

}

define authorized_keys ($sshkeys, $ensure = "present", $home = '') {
    # This line allows default homedir based on $title variable.
    # If $home is empty, the default is used.
    $homedir = $home ? {'' => "/home/${title}", default => $home}
    file {
        "${homedir}/.ssh":
            ensure  => "directory",
            owner   => $title,
            group   => $title,
            mode    => 700,
            require => User[$title];
        "${homedir}/.ssh/authorized_keys":
            ensure  => $ensure,
            owner   => $ensure ? {'present' => $title, default => undef },
            group   => $ensure ? {'present' => $title, default => undef },
            mode    => 600,
            require => File["${homedir}/.ssh"],
            content => template("authorized_keys.erb");
    }
}

define add_group($gid) {

    $groupname = $title
 
    group { $groupname:
        gid     => $gid,
    }
}
