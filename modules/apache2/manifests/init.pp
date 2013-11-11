# Install apache2
#
# Usage:
# include apache2
#

class apache2 {
    package { "apache2-mpm-prefork": ensure => latest }
    package { "libapache2-mod-wsgi": ensure => latest }
}

