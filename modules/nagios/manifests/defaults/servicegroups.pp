class nagios::defaults::servicegroups {
  nagios_servicegroup {
    'all':
      alias   => 'All Services';
  }
}
