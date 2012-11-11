class mysql::config::client {
  mysql::config {
    'client/socket':
      value => $::operatingsystem ? {
        /RedHat|Fedora|CentOS/ => '/var/lib/mysql/mysql.sock',
        default                => '/var/run/mysqld/mysqld.sock',
      }
  }
}
