class mysql::server::medium inherits mysql::server::base {

# Implementation of my-medium.cnf provided as an example with mysql
# distribution.
# This is for a system with little memory (32M - 64M) where MySQL plays
# an important part, or systems up to 128M where MySQL is used together with
# other programs (such as a web server).

  include mysql::config::performance::medium
  include mysql::config::mysqld
  include mysql::config::replication
  include mysql::config::mysqld_safe
  include mysql::config::client
}
