/*

==Class: mysql::server

*/
class mysql::server {

  include mysql::server::base

  include mysql::config::performance
  include mysql::config::mysqld
  include mysql::config::replication
  include mysql::config::mysqld_safe
  include mysql::config::client
}
