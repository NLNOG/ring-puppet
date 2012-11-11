class mysql::master inherits mysql::server {
  include mysql::config::replication::master
}
