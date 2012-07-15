class nagios::defaults::hostgroups {
  nagios_hostgroup {
    'all':
      alias   => 'All Servers',
    	members => '*';
  }
}
