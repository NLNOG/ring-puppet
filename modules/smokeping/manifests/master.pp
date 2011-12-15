# master.pp - the smokeping master 
# Copyright (C) 2011 Job Snijders <job@snijders-it.nl>
# See LICENSE for the full license granted to you.

class smokeping::master {
 
    module_dir { [ "smokeping", "smokeping/nodes" ]: }

    package { "smokeping": 
        ensure => latest,
    }

    package { ["libapache2-mod-fcgid", "apache2.2-common"]:
        ensure => latest,
    }

    File <<| tag == smokeping |>> 

    File <<| tag == smokeping-slaves |>>

    Line <<| tag == smokeping-msecret |>>
 
    file {
        "/etc/smokeping/config.d/Targets.header":
            content => template("smokeping/targetsheader.erb"),
            mode => 0644, owner => root, group => root,
            before => File["/etc/smokeping/config.d/Targets"],
            require => File["/etc/hosts"],
            subscribe => File["/etc/hosts"],
        }
 
    concatenated_file { "/etc/smokeping/config.d/Targets":
        dir => $SP_NODESDIR,
        header => "/etc/smokeping/config.d/Targets.header",
        require => File["/etc/smokeping/config.d/Targets.header"],
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
        "/etc/smokeping/config.d/General":
            mode => 0644, owner => root, group => root,
            content => template("smokeping/general-info.erb"),
            require => Package["smokeping"],
    }

    service { "smokeping":
        ensure => running, 
    }

    exec { "/usr/bin/killall -HUP /usr/bin/perl":
        alias   => "hup_fcgi_stuff",
    }

    exec { "/etc/init.d/smokeping reload":
        subscribe => File["/etc/smokeping/config.d/Targets", "/etc/smokeping/config.d/Slaves"],
        refreshonly => true
        require => Exec["hup_fcgi_stuff"],
    }
}
