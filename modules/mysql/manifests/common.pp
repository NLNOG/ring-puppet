/*
** class mysql::common
**
** this class should be included to use
** any mysql resource.
**
*/
class mysql::common {

  group { 'mysql-admin':
    ensure => present,
  }

}
