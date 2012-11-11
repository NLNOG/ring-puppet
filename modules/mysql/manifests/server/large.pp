class mysql::server::large inherits mysql::server::base {

# Implementation of my-large.cnf provided as an example with mysql
# distribution.
# This is for a large system with memory = 512M where the system runs mainly
# MySQL.

  include mysql::config::performance::large
  include mysql::config::mysqld
  include mysql::config::replication
  include mysql::config::mysqld_safe
  include mysql::config::client
}
