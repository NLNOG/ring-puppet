/*

==Class: mysql::server::base

Parameters:
 $mysql_data_dir:
   set the data directory path, which is used to store all the databases

   If set, copies the content of the default mysql data location. This is
   necessary on Debian systems because the package installation script
   creates a special user used by the init scripts.

*/
class mysql::server::base {

  include mysql::params

  user { "mysql":
    ensure => present,
    require => Package["mysql-server"],
  }

  package { "mysql-server":
    ensure => installed,
  }

  file { "${mysql::params::data_dir}":
    ensure  => directory,
    owner   => "mysql",
    group   => "mysql",
    seltype => "mysqld_db_t",
    require => Package["mysql-server"],
  }

  if( "${mysql::params::data_dir}" != "/var/lib/mysql" ) {
    File["${mysql::params::data_dir}"]{
      source  => "/var/lib/mysql",
      recurse => true,
      replace => false,
    }
  }

  file { "/etc/mysql/my.cnf":
    ensure => present,
    path => $mysql::params::mycnf,
    owner => root,
    group => root,
    mode => 644,
    seltype => "mysqld_etc_t",
    require => Package["mysql-server"],
  }

  service { "mysql":
    ensure      => running,
    enable      => true,
    name        => $operatingsystem ? {
      /RedHat|Fedora|CentOS/ => "mysqld",
      default => "mysql",
    },
    require   => Package["mysql-server"],
  }

  if $mysql_user {} else { $mysql_user = "root" }

  if $mysql_password {

    if $mysql_exists == "true" {
      mysql_user { "${mysql_user}@localhost":
        ensure => present,
        password_hash => mysql_password($mysql_password),
        require => Exec["Generate my.cnf"],
      }
    }

    file { "/root/.my.cnf":
      ensure => present,
      owner => root,
      group => root,
      mode  => 600,
      content => template("mysql/my.cnf.erb"),
      require => Exec["Initialize MySQL server root password"],
    }

  } else {

    $mysql_password = generate("/usr/bin/pwgen", 20, 1)

    file { "/root/.my.cnf":
      owner => root,
      group => root,
      mode  => 600,
      require => Exec["Initialize MySQL server root password"],
    }

  }

  exec { "Initialize MySQL server root password":
    unless      => "test -f /root/.my.cnf",
    command     => "mysqladmin -u${mysql_user} password ${mysql_password}",
    notify      => Exec["Generate my.cnf"],
    require     => [Package["mysql-server"], Service["mysql"]]
  }

  exec { "Generate my.cnf":
    command     => "/bin/echo -e \"[mysql]\nuser=${mysql_user}\npassword=${mysql_password}\n[mysqladmin]\nuser=${mysql_user}\npassword=${mysql_password}\n[mysqldump]\nuser=${mysql_user}\npassword=${mysql_password}\n[mysqlshow]\nuser=${mysql_user}\npassword=${mysql_password}\n\" > /root/.my.cnf",
    refreshonly => true,
    creates     => "/root/.my.cnf",
  }

  $logfile_group = $mysql::params::logfile_group

  file { "/etc/logrotate.d/mysql-server":
    ensure => present,
    content => $operatingsystem ? {
      /RedHat|Fedora|CentOS/ => template('mysql/logrotate.redhat.erb'),
                    /Debian/ => template('mysql/logrotate.debian.erb'),
      default => undef,
    }
  }

  file { "mysql-slow-queries.log":
    ensure  => present,
    owner   => mysql,
    group   => mysql,
    mode    => 640,
    seltype => mysqld_log_t,
    path    => $operatingsystem ? {
      /RedHat|Fedora|CentOS/ => "/var/log/mysql-slow-queries.log",
      default => "/var/log/mysql/mysql-slow-queries.log",
    };
  }

}
