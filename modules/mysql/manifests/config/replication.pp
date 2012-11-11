class mysql::config::replication {
  # Replication
  # by default, replication is disabled
  mysql::config {
    'log-bin':         ensure => absent;
    'server-id':       ensure => absent;
    'master-host':     ensure => absent;
    'master-user':     ensure => absent;
    'master-password': ensure => absent;
    'report-host':     ensure => absent;
  }

}
