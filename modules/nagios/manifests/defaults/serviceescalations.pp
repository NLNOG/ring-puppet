class nagios::defaults::serviceescalations {
  nagios_serviceescalation {
    hostgroup_name          => 'all',
    servicegroup_name       => 'all',
    first_notification      => 2,
    last_notification       => 2,
    notification_interval   => 1440,
    contacts                => 'ring-admins',
  }
}
