class mysql::config::replication::slave inherits mysql::config::replication {
  Mysql::Config['master-host'] {
    ensure => present,
    value  => $mysql_masterhost,
  }

  Mysql::Config['master-user'] {
    ensure => present,
    value  => $mysql_masteruser,
  }

  Mysql::Config['master-password'] {
    ensure => present,
    value  => $mysql_masterpw,
  }

  Mysql::Config['report-host'] {
    ensure => present,
    value  => $hostname,
  }

  mysql::config {
    'relay-log':             value => '/var/lib/mysql/mysql-relay-bin';
    'relay-log-index':       value => '/var/lib/mysql/mysql-relay-bin.index';
    'relay-log-info-file':   value => '/var/lib/mysql/relay-log.info';
    'relay_log_space_limit': value => '2048M';
    'max_relay_log_size':    value => '100M';
  }
}
