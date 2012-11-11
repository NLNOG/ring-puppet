/*
== Class: mysql::slave::common
** The composants available in all versions of MySQL
** This is the inital mysql::slave class.
*/
class mysql::slave::common inherits mysql::master {

  include mysql::config::replication::slave
}
