class mysql::config::mysqld {
  mysql::config {
    'pid-file':             value => '/var/run/mysqld/mysqld.pid';
    'old_passwords':        value => '0';
    'character-set-server': value => 'utf8';
    'log-warnings':         value => '1';
    'datadir':              value => "${mysql::params::data_dir}";
    'log-error':            value => $::operatingsystem ? {
      /RedHat|Fedora|CentOS/ => '/var/log/mysqld.log',
      default                => '/var/log/mysql.err',
      };
    'log-slow-queries':     value => $::operatingsystem ? {
      /RedHat|Fedora|CentOS/ => '/var/log/mysql-slow-queries.log',
      default                => '/var/log/mysql/mysql-slow.log',
      };
    # "ins log-slow-admin-statements after log-slow-queries", # BUG: not implemented in puppet yet
    'socket':                value => $::operatingsystem ? {
      /RedHat|Fedora|CentOS/ => '/var/lib/mysql/mysql.sock',
      default                => '/var/run/mysqld/mysqld.sock',
      };
  }
}
