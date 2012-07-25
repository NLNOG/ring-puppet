# host.pp - the master host of the munin installation
# Copyright (C) 2007 David Schmitt <david@schmitt.edv-bus.at>
# See LICENSE for the full license granted to you.

class munin::host
{
	include munin::client

	module_dir { [ "munin/nodes" ]: }

    package { [ "munin" ]: ensure => installed, }

	File <<| tag == 'munin' |>>

	concatenated_file { "/etc/munin/munin.conf":
		dir => $NODESDIR,
		header => "/etc/munin/munin.conf.header",
	}

	file {
		"/etc/munin/munin.conf.header":
			source => "/etc/munin/munin.conf",
			replace => no, # only initialise
			mode => 0644, owner => root, group => 0,
			before => File["/etc/munin/munin.conf"];
	}
	
	file { ["/var/log/munin-update.log", "/var/log/munin-limits.log", 
	        "/var/log/munin-graph.log", "/var/log/munin-html.log"]:
		ensure => present,
		mode => 640, owner => munin, group => root;
  }
	
}

class munin::snmp_collector
{

	file { 
		"${module_dir_path}/munin/create_snmp_links":
			source => "puppet:///modules/munin/create_snmp_links.sh",
			mode => 755, owner => root, group => root;
	}

	exec { "create_snmp_links":
		command => "${module_dir_path}/munin/create_snmp_links $NODESDIR",
		require => File["snmp_links"],
		timeout => "2048",
		schedule => daily
	}
}

define munin::apache_site()
{
	apache::site {
		$name:
			ensure => present,
			content => template("munin/site.conf")
	}
}
