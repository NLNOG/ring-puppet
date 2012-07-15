class nagios::defaults::servicegroups {
  nagios_servicegroup {
    'all':
    	members => '*';
  }
}
