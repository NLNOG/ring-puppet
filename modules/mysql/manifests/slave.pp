/*

== Class: mysql::slave

Define a MySQL slave server

*/
class mysql::slave inherits mysql::slave::common {

  # binlog_format comes with MySQL 5.1+
  # RHEL6+, Debian6+
  case  $operatingsystem {

    Debian: {
      case $lsbmajdistrelease {

        "4","5": { }

        default: {
          mysql::config {'binlog_format':
            value => "${mysql::params::replication_binlog_format}",
          }
        }
      }

    } # Debian

    RedHat,CentOS: {
      case $lsbmajdistrelease {

        "4","5": { }

        default: {
          mysql::config {'binlog_format':
            value => "${mysql::params::replication_binlog_format}",
          }
        }
      }

    } # RedHat,CentOS

  } # case $operatingsystem

}
