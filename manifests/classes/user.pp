# this class creates the users
# it should be converted to a virtual user setup

define add_user($email,$company,$uid,$groups,$ensure="present") {

    $username = $title
    $admingroup = "admin"
    $allgroups = $groups
    # nasty hack for bird shell enforcement
    if ($fqdn =~ /lg0[12].infra.ring.nlnog.net/) and ($groups !~ /ring-admins/) {
        if ($username != 'dave') {
            $shell = "/usr/local/bin/birdshell"
        }
    } else {
        $shell = "/bin/bash"
    }

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
        shell   => $shell,
        uid     => $uid,
        groups  => $allgroups,
        ensure  => $ensure,
    }
 
    group { $username:
        gid     => $uid,
        require => User[$username],
        ensure  => $ensure,
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

    Authorized_keys <| title == "${title}" |>

    # on the manage server drop a copy of the user contributed ssh-keys file
    # with a specific filename in a easy-to-rsync location
    # (and ensure that if a user is deleted, the file disappears)
    if ($fqdn == "auth.infra.ring.nlnog.net") and ($groups !~ /ring-admins/) and ($ensure == "present") {
        exec { "auth_copy_sshkey_${username}":
            command => "/usr/bin/install -m 0444 /home/${username}/ssh-keys /opt/keys/${username}.sshkeys",
        }
    }
    elsif ($fqdn == "auth.infra.ring.nlnog.net") and ($groups !~ /ring-admins/) and ($ensure == "absent") {
        file { "auth_/opt/keys/${username}.sshkeys":
            path => "/opt/keys/${username}.sshkeys",
            ensure => absent,
        }
    }

    # for regular users use the ssh key file that comes from 
    # auth.infra.ring.nlnog.net
    if ($groups !~ /ring-admins/) and ($ensure == "present") {
        $file_sshkeys = "/opt/keys/${username}.sshkeys"
        $tmp_sshkeys = inline_template("<%= `/bin/cat #{file_sshkeys}` %>")
        $array_sshkeys = split($tmp_sshkeys, "\n")
        @authorized_keys { "$username":
            sshkeys => $array_sshkeys,
        }
    } elsif ($groups !~ /ring-admins/) and ($ensure == "absent") {
        # delete the ssh key file if they are not part of the ring
        file { "/home/${username}/.ssh/authorized_keys":
            ensure  => absent,    
        }
    }
}

define authorized_keys ($sshkeys, $ensure = "present", $home = '') {
    # This line allows default homedir based on $title variable.
    # If $home is empty, the default is used.
    $homedir = $home ? {'' => "/home/${title}", default => $home}
    file { "${homedir}/.ssh/authorized_keys":
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
