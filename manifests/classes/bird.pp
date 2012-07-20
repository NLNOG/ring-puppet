class bird {
    exec { "add_bird_repo":
        path    => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
        timeout => 3600,
        command => "add-apt-repository -y ppa:cz.nic-labs/bird; apt-get update",
        unless  => "/usr/bin/test -f /etc/apt/sources.list.d/cz_nic-labs-bird-precise.list",
        before  => Package["bird", "bird6"],
    }

    package { ["bird", "bird6"]:
        ensure => latest,
    }
    
    service { ["bird"]:
        ensure  => running,
        enable  => true,
        subscribe   => File["/etc/bird.conf"],
    }

    service { ["bird6"]:
        ensure  => running,
        enable  => true,
        subscribe   => File["/etc/bird6.conf"],
    }

    file { "/etc/bird.conf":
        owner   => root,
        group   => root,
        mode    => 0755,
        content => template("bird.conf.rb"),
        ensure  => file,
    }
    
    file { "/etc/bird6.conf":
        owner   => root,
        group   => root,
        mode    => 0755,
        content => template("bird6.conf.rb"),
        ensure  => file,
    }

}
