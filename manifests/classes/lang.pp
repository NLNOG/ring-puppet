class lang {
        file { "/etc/default/locale":
        owner   => root,
        group   => root,
        mode    => 0644,
        content => "LANG=\"en_US.UTF-8\"",
        ensure  => file,
    }

    file { "/var/lib/locales/supported.d/local":
        owner   => root,
        group   => root,
        mode    => 0644,
        source  => "puppet:///files/var/lib/locales/supported.d/local",
        ensure  => file,
    }
       
    exec { "update-locale":
        subscribe   => [ File["/etc/default/locale"], File["/var/lib/locales/supported.d/local"] ],
        command     => "locale-gen",
        refreshonly => true,
        environment => "LANG=\"en_US.UTF-8\"",
        require     => Package["locales"],
    }
   
    package { "locales":
        ensure  => latest,
    }
}
