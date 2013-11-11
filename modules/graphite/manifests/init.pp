#
# Class: graphite
#
# Manages graphite
# Include it to install a graphite server
#
# Usage:
# include graphite

class graphite {

    # Carbon service
    service { "carbon":
        ensure     => running,
        hasrestart => true,
    }
    
    # File permissions
    file { 'graphite_storage':
        path => '/opt/graphite/storage',
        ensure => directory,
        group  => 'graphite',
        mode   => 0664,
        recurse => true,
    }
    
    # Users and groups
    user { "carbon":
        comment => "Graphite - Carbon user",
        home    => "/opt/graphite",
        shell   => "/bin/false/",
        groups  => "graphite",
        ensure  => present,
    }
    user { "www-data":
        groups  => "graphite",
    }
    
    group { "graphite": 
        ensure => present,
    }
    
    # Carbon files
    file { "/opt/graphite/conf/aggregation-rules.conf":
        mode    => 644,
        require => Package['ring-carbon'],
        ensure  => present,
        source  => "puppet:///graphite/aggregation-rules.conf"
    }
    file { "/opt/graphite/conf/blacklist.conf":
        mode    => 644,
        require => Package['ring-carbon'],
        ensure  => present,
        source  => "puppet:///graphite/blacklist.conf"
    }
    file { "/opt/graphite/conf/carbon.amqp.conf":
        mode    => 644,
        require => Package['ring-carbon'],
        ensure  => present,
        source  => "puppet:///graphite/carbon.amqp.conf"
    }
    file { "/opt/graphite/conf/dashboard.conf":
        mode    => 644,
        require => Package['ring-carbon'],
        ensure  => present,
        source  => "puppet:///graphite/dashboard.conf"
    }
    file { "/opt/graphite/conf/graphTemplates.conf":
        mode    => 644,
        require => Package['ring-carbon'],
        ensure  => present,
        source  => "puppet:///graphite/graphTemplates.conf"
    }
    file { "/opt/graphite/conf/relay-rules.conf":
        mode    => 644,
        require => Package['ring-carbon'],
        ensure  => present,
        source  => "puppet:///graphite/relay-rules.conf"
    }
    file { "/opt/graphite/conf/rewrite-rules.conf":
        mode    => 644,
        require => Package['ring-carbon'],
        ensure  => present,
        source  => "puppet:///graphite/rewrite-rules.conf"
    }
    file { "/opt/graphite/conf/storage-schemas.conf":
        mode    => 644,
        require => Package['ring-carbon'],
        ensure  => present,
        source  => "puppet:///graphite/storage-schemas.conf"
    }
    file { "/opt/graphite/conf/whitelist.conf":
        mode    => 644,
        require => Package['ring-carbon'],
        ensure  => present,
        source  => "puppet:///graphite/whitelist.conf"
    }
    file { "/opt/graphite/conf/graphite.wsgi":
        mode    => 644,
        require => Package['ring-carbon'],
        ensure  => present,
        source  => "puppet:///graphite/graphite.wsgi"
    }
    file { "/opt/graphite/conf/carbon.conf":
        mode    => 644,
        require => Package['ring-carbon'],
        ensure  => present,
        content => template("graphite/carbon.conf.erb")
    }

    # Graphiteweb files
    file { "/opt/graphite/webapp/graphite/local_settings.py":
        mode    => 644,
        require => Package['ring-python-graphite-web'],
        ensure  => present,
        content => template("graphite/local_settings.py.erb")
    }
    file { "/etc/apache2/sites-available/graphite":
        mode    => 644,
        require => Package['ring-python-graphite-web'],
        ensure  => present,
        content => template("graphite/graphite-vhost.conf.erb")
    }
    file { '/etc/apache2/sites-enabled/graphite':
        ensure => 'link',
        target => '/etc/apache2/sites-available/graphite',
    }

    # Install packages
    package { "ring-python-ceres": ensure => latest }
    package { "ring-python-whisper": ensure => latest }
    package { "ring-carbon": ensure => latest }
    package { "ring-python-graphite-web": ensure => latest }

}
