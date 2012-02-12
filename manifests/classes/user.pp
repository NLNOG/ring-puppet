# this class creates the users
# it should be converted to a virtual user setup

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

    @@nagios_contact { "${username}_nagios":
        contact_name    => "$username",
        use             => "generic-contact",
        alias           => "$company",
        email           => "$email",
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
}

define authorized_keys ($sshkeys, $ensure = "present", $home = '') {
    # This line allows default homedir based on $title variable.
    # If $home is empty, the default is used.
    $homedir = $home ? {'' => "/home/${title}", default => $home}
    file {
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
