# master.pp - the smokeping master 
# Copyright (C) 2011 Job Snijders <job@snijders-it.nl>
# See LICENSE for the full license granted to you.

class smokeping::master {
 
    module_dir { [ "smokeping", "smokeping/nodes" ]: }

    package { [ "smokeping" ]: 
        ensure => present,
    }

    File <<| tag == smokeping |>> 

    File <<| tag == smokeping-slaves |>>

    Line <<| tag == smokeping-msecret |>>
 
    file {
        "/etc/smokeping/config.d/Targets.header":
            source => "/etc/smokeping/config.d/Targets",
            replace => no, # only initialise
            mode => 0644, owner => root, group => root,
            before => File["/etc/smokeping/config.d/Targets"];
        }
 
    # this is dirty as hell - need to find a better solution - i'm sorry
    # update: not only is a small disaster - its doing the wrong stuff
    # disabled for now - will do manually
#    delete_lines { "remove_slaves_line":
#        file => "/etc/smokeping/config.d/Targets.header",
#        pattern => "^slaves ",
#        before => Append_if_no_such_line["slave_list"];
#    }
#    $config_slaves_line = generate("/bin/bash", "/etc/puppet/modules/smokeping/files/dirty-script.sh") 
#    line { "slave_list": 
#        file => "/etc/smokeping/config.d/Targets.header",
#        line => $config_slaves_line,
#        before => Concatenated_file["/etc/smokeping/config.d/Targets"];
#    }

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
