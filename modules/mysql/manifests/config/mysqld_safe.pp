class mysql::config::mysqld_safe {
  # mysqld_safe
  mysql::config {
    'mysqld_safe/pid-file':
      value   => '/var/run/mysqld/mysqld.pid';
    'mysqld_safe/socket':
      value   => $::operatingsystem ? {
        /RedHat|Fedora|CentOS/ => '/var/lib/mysql/mysql.sock',
        default                => '/var/run/mysqld/mysqld.sock', 
      };
  }
}
