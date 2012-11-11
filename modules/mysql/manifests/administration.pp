class mysql::administration {

  include mysql::common

# TODO:
# - permissions to edit my.cnf once augeas bug is corrected (see
#   modules/cognac/manifests/classes/mysql-slave.pp)
# - .my.cnf for people in %mysql-admin

  sudo::directive { "mysql-administration":
    ensure  => present,
    content => template("mysql/sudoers.mysql.erb"),
    require => Group["mysql-admin"],
  }

}
