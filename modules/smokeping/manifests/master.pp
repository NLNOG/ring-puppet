# master.pp - the smokeping master 
# Copyright (C) 2011 Job Snijders <job@snijders-it.nl>
# See LICENSE for the full license granted to you.

class smokeping::master {
 
    module_dir { [ "smokeping", "smokeping/nodes" ]: }

    package { [ "smokeping" ]: 
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
    }
    
    file {
        "/etc/smokeping/config.d/Slaves.header":
            source => "puppet:///smokeping/Slaves",
            mode => 0644, owner => root, group => root,
            before => File["/etc/smokeping/config.d/Slaves"];
    }

    concatenated_file { "/etc/smokeping/config.d/Slaves":
        dir => $SP_SLAVES_DIR,
        header => "/etc/smokeping/config.d/Slaves.header",
    }

        file {
        "/etc/smokeping/master_secrets":
            mode => 0640, owner => www-data, group => root,
            ensure => present,
    }
    
    file {
        "/etc/smokeping/config.d/General":
            mode => 0644, owner => root, group => root,
            content => template("smokeping/general-info.erb"),
    }

    service { "smokeping":
        ensure => running, 
        subscribe => File["/etc/smokeping/config.d/Slaves"],
    }

    exec { "/etc/init.d/smokeping restart":
        subscribe => File["/etc/smokeping/config.d/Targets"],
        refreshonly => true
    }
}
