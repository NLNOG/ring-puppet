# Class: mysql
#
#   This class installs mysql client software.
#
# Parameters:
#   [*client_package_name*]  - The name of the mysql client package.
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class mysql (
  $package_name   = $mysql::params::client_package_name,
  $package_ensure = 'present'
) inherits mysql::params {

  package { 'mysql_client':
    ensure => $package_ensure,
    name   => $package_name,
  }

  $configdir = "/etc/mysql/conf.d"
  $ssldir = "/etc/mysql/ssl"
  $ssldirca = "$ssldir/ca.pem"
  $ssldircert = "$ssldir/${fqdn}.pem"
  $ssldirkey = "$ssldir/key-${fqdn}.pem"

  file { 
    "/etc/mysql":
        ensure => directory,
        owner => mysql, group => mysql, mode => 644;
    $configdir:
        ensure => directory,
        owner => mysql, group => mysql, mode => 644,
        require => Package["mysql-server"];
    $ssldir:
        ensure => directory,
        owner => mysql, group => mysql, mode => 600;
    $ssldirca:
        ensure => present,
        source => $cacert,
        owner => mysql, group => mysql, mode => 600;
    $ssldircert:
        ensure => present,
        source => $signedcert,
        owner => mysql, group => mysql, mode => 600;
    $ssldirkey:
        ensure => present,
        source => $certkey,
        owner => mysql, group => mysql, mode => 600;
    "/etc/mysql/conf.d/ssl.conf":
        content => template("mysql/ssl.conf.erb")
        owner => mysql, group => mysql, mode => 644;
  }
}
