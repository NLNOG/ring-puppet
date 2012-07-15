class nagios::defaults::hostescalations {
  nagios_hostescalation { 'all':
    hostgroup_name          => 'all',
    first_notification      => 2,
    last_notification       => 2,
    notification_interval   => 1440,
    contacts                => 'ring-admins',
  }
}
