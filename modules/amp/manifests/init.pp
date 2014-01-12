class amp_client {

    package { ["amplet-client"]:
        ensure => latest,
    }
 
    package { ["amplet-common"]:
        ensure => latest,
    }

    file { "/usr/lib/amp/ext-bin/scamper":
        ensure  => "/usr/bin/scamper",
        require => Package["amplet-client"],
    }
    
    file { "/etc/amp/datahome":
        content => "/home/measure/amp-data",
        require => Package["amplet-client"],
    }

    file { "/usr/bin/scamper":
        mode    => 6755,
        owner   => "root",
        group   => "root",
        require => Package["scamper"],
    }
    
    file { "/etc/amp/collectors":
        ensure  => file,
        mode    => 0644,
        owner   => root,
        group   => root,
        source  => "puppet:///amp/collectors",
        require => Package["amplet-client"],
    }

    file { "/etc/default/amp":
        ensure  => file,
        mode    => 0644,
        owner   => root,
        group   => root,
        source  => "puppet:///amp/amp-default",
        require => Package["amplet-client"],
    }

    file { "/etc/amp/ampnameprefix":
        ensure  => file,
        mode    => 0644,
        owner   => root,
        group   => root,
        source  => "puppet:///amp/ampnameprefix",
        require => Package["amplet-client"],
    }

    file { "/etc/amp/ampname":
        ensure  => file,
        mode    => 0644,
        owner   => root,
        group   => root,
        source  => "puppet:///amp/ampname",
        require => Package["amplet-client"],
    }

    file { "/etc/amp/nametable":
        ensure  => file,
        mode    => 0644,
        owner   => root,
        group   => root,
        source  => "puppet:///amp/nametable",
        require => Package["amplet-client"],
    }

    file { "/etc/amp/schedule":
        ensure  => file,
        mode    => 0644,
        owner   => root,
        group   => root,
        source  => "puppet:///amp/schedule",
        require => Package["amplet-client"],
    }

    file { "/etc/amp/cacert.pem":
        ensure  => file,
        mode    => 0644,
        owner   => root,
        group   => root,
        source  => "puppet:///amp/cacert.pem",
        require => Package["amplet-client"],
    }
    file { "/etc/amp/client-cert.pem":
        ensure  => file,
        mode    => 0644,
        owner   => root,
        group   => root,
        source  => "puppet:///amp/client-cert.pem",
        require => Package["amplet-client"],
    }
    file { "/etc/amp/client-privkey.pem":
        ensure  => file,
        mode    => 0644,
        owner   => root,
        group   => root,
        source  => "puppet:///amp/client-privkey.pem",
        require => Package["amplet-client"],
    }

    service { "amp":
        ensure      => "stopped",
        subscribe   => File["/etc/amp/collectors", "/etc/amp/nametable", "/etc/amp/schedule", "/etc/amp/ampnameprefix"],
        require     => Package["amplet-client", "amplet-common"],
        hasstatus   => false,
        hasrestart  => true,
        enable      => false,
    }
}
