# master.pp - the smokeping master 
# Copyright (C) 2011 Job Snijders <job@snijders-it.nl>
# See LICENSE for the full license granted to you.

class smokeping::master {
 
    module_dir { [ "smokeping", "smokeping/v4", "smokeping/v6", "smokeping/slaves"]: }

    package { "smokeping": 
        ensure => latest,
    }

    package { ["libapache2-mod-fcgid", "apache2.2-common"]:
        ensure => latest,
    }

    File <<| tag == smokeping_v4 |>> 
    File <<| tag == smokeping_v6 |>> 

    File <<| tag == smokeping_slaves |>>

    Line <<| tag == smokeping-msecret |>>

    file {
        "/etc/smokeping/config.d/Targets_header":
            content => template("smokeping/targetsheader_v4.erb"),
            mode => 0644, owner => root, group => root,
            require => File["/etc/hosts"],
            subscribe => File["/etc/hosts"],
        }
 
    file {
        "/etc/smokeping/config.d/Targets_header_v6":
            content => template("smokeping/targetsheader_v6.erb"),
            mode => 0644, owner => root, group => root,
        }
 
    concatenated_file { "/etc/smokeping/config.d/Targets_v4":
        dir => "$SP_NODESDIR/v4",
    }

    concatenated_file { "/etc/smokeping/config.d/Targets_v6":
        dir => "$SP_NODESDIR/v6",
       require => File["/etc/smokeping/config.d/Targets_header_v6"],
    }

    file {
        "/etc/apache2/conf.d/smokeping":
            source => "puppet:///smokeping/apache-config-smokeping",
            mode => 0644, owner => root, group => root,
            require => Package["smokeping", "apache2.2-common"],
    }
    file {
        "/usr/lib/cgi-bin/smokeping.fcgi":
            source => "puppet:///smokeping/smokeping.fcgi",
            mode => 0755, owner => root, group => root,
            require => Package["smokeping"],
    }
   
    file {
        "/etc/init.d/smokeping":
            source => "puppet:///smokeping/init.d-smokeping",
            mode => 0755, owner => root, group => root,
            require => Package["smokeping"],
    }

    concatenated_file { "/etc/smokeping/config.d/Slaves":
        dir => $SP_SLAVES_DIR,
        header => "/etc/smokeping/config.d/Slaves.header",
        require => Package["smokeping"],
    }

    file {
        "/etc/smokeping/master_secrets":
        mode => 0640, owner => www-data, group => root,
        ensure => present,
        require => Package["smokeping"],
    }

    file {
        "/var/lib/smokeping":
        mode => 0775, owner => "www-data", group => "smokeping",
        ensure => directory,
        require => Package["smokeping"],
    }

    file {
        "/etc/smokeping/config.d/General":
            mode => 0644, owner => root, group => root,
            content => template("smokeping/general-info.erb"),
            require => Package["smokeping"],
    }

    file {
        "/etc/smokeping/config.d/Probes":
            mode => 0644, owner => root, group => root,
            source  => "puppet:///smokeping/Probes",
            require => Package["smokeping"],
    }

    file {
        "/etc/smokeping/config":
            mode => 0644, owner => root, group => root,
            source  => "puppet:///smokeping/config",
            require => Package["smokeping"],
    }


    service { "smokeping":
        ensure => running, 
    }

    exec { "/usr/bin/killall -HUP /usr/bin/perl":
        alias   => "hup_fcgi_stuff",
        subscribe => File["/etc/smokeping/config.d/Targets_v4", "/etc/smokeping/config.d/Slaves", "/etc/smokeping/config.d/Targets_header"],
        refreshonly => true,
    }

    exec { "/etc/init.d/smokeping reload":
        subscribe => File["/etc/smokeping/config.d/Targets_v4", "/etc/smokeping/config.d/Slaves", "/etc/smokeping/config.d/Targets_header"],
        refreshonly => true,
    }
}
