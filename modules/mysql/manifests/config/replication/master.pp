class mysql::config::replication::master inherits mysql::config::replication {
  Mysql::Config['log-bin'] {
    ensure => 'present',
    value  => 'mysql-bin',
  }

  Mysql::Config['server-id'] {
    ensure => 'present',
    value  => $mysql_serverid,
  }

  mysql::config {
    'expire_logs_days': value => '7';
    'max_binlog_size':  value => '100M';
  }
}
