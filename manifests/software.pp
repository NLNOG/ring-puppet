# Class: master_software
#
class master_software {
    package { "libactiverecord-ruby1.8": ensure => latest }
    package { "libsqlite3-ruby1.8": ensure => latest }
    package { "sqlite3": ensure => latest }
    package { "libactivesupport-ruby1.8": ensure => latest }
    package { "rails": ensure => latest }
    package { "mysql-server": ensure => latest }
    package { "libmysql-ruby": ensure => latest }
    package { "puppetmaster": ensure => latest }
    package { "etckeeper": ensure => latest }
    package { "puppetmaster-common": ensure => latest }
}

class puppet_pkgs {
    package { "puppet": ensure => latest }
    package { "puppet-common": ensure => latest }
}

