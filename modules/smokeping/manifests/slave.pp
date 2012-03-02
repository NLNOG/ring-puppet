# slave.pp - configure a smokeping slave
# Copyright (C) 2011 Job Snijders <job@snijders-it.nl>
# See LICENSE for the full license granted to you.

class smokeping::slave {
    module_dir { [ "smokeping" ]: }
    include smokeping::slave::install
}

define smokeping::register()
{
    @@file { "${SP_NODESDIR}/v4/${name}":
        ensure => present,
        content => template("smokeping/targets_v4.erb"),
        tag => 'smokeping_v4',
    }

    @@file { "${SP_NODESDIR}/v6/${name}":
        ensure => present,
        content => template("smokeping/targets_v6.erb"),
        tag => 'smokeping_v6',
    }
        
    @@line { "secret_${name}":
        file => "/etc/smokeping/master_secrets",
        line => "${name}:${smokeping::slave::install::random_value}",
        tag => 'smokeping-msecret',
    }

    @@file { "${SP_SLAVES_DIR}/${name}":
        ensure => present,
        content => template("smokeping/makeslaves.erb"),
        tag => 'smokeping_slaves',
    }
} 

class smokeping::slave::install {
    package { "apache2.2-common":
        ensure => installed,
    }
    package { "apache2":
        ensure => installed,
        require => Package["apache2.2-common"],
    }
    package { "smokeping": 
        ensure => latest,
        before => Service["smokeping"],
    }

    file {
        "/etc/default/smokeping":
            mode => 0644, owner => root, group => root,
            source => "puppet:///smokeping/defaults-smokeping",
            before => Package["smokeping"]
    }

    service { "smokeping":
          ensure => running, 
          require => Package["smokeping"],
    }
    
    # this could use some improvement
    $random_value = fqdn_rand(1000000)

    file { "/etc/smokeping":
        ensure => directory,
        mode => 0644, owner => root, group => root,
    }
    file {
        "/etc/smokeping/slave-secret":
            mode => 0600, owner => smokeping, group => smokeping,
            content =>  $random_value,
            require => File["/etc/smokeping"],
    }

    file {
        "/etc/init.d/smokeping":
            source => "puppet:///smokeping/init.d-smokeping-slave",
            mode => 0755, owner => root, group => root,
            require => Package["smokeping"],
    }

   smokeping::register { $fqdn: }
}
