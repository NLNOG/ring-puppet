class mysql::server::small inherits mysql::server::base {

# Implementation of my-small.cnf provided as an example with mysql
# distribution.
# This is for a system with little memory (<= 64M) where MySQL is only used
# from time to time and it's important that the mysqld daemon
# doesn't use much resources.

  include mysql::config::performance::small
  include mysql::config::mysqld
  include mysql::config::replication
  include mysql::config::mysqld_safe
  include mysql::config::client
}
