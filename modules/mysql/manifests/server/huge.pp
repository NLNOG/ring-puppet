class mysql::server::huge inherits mysql::server::base {

# Implementation of my-huge.cnf provided as an example with mysql
# distribution.
# This is for a large system with memory of 1G-2G where the system runs mainly
# MySQL.
  include mysql::config::performance::huge
  include mysql::config::mysqld
  include mysql::config::replication
  include mysql::config::mysqld_safe
  include mysql::config::client
}
