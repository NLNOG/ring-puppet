class amp_client {

    package { ["amp-client"]:
        ensure => latest,
    }
    
    file { "/etc/amp/collectors":
        ensure  => file,
        mode    => 0644,
        owner   => root,
        group   => root,
        source  => "puppet:///amp/collectors",
    }

    file { "/etc/amp/ampnameprefix":
        ensure  => file,
        mode    => 0644,
        owner   => root,
        group   => root,
        source  => "puppet:///amp/ampnameprefix",
    }

    file { "/etc/amp/nametable":
        ensure  => file,
        mode    => 0644,
        owner   => root,
        group   => root,
        source  => "puppet:///amp/nametable",
    }

    file { "/etc/amp/schedule":
        ensure  => file,
        mode    => 0644,
        owner   => root,
        group   => root,
        source  => "puppet:///amp/schedule",
    }

    file { "/etc/amp/cacert.pem":
        ensure  => file,
        mode    => 0644,
        owner   => root,
        group   => root,
        source  => "puppet:///amp/cacert.pem",
    }
    file { "/etc/amp/client-cert.pem":
        ensure  => file,
        mode    => 0644,
        owner   => root,
        group   => root,
        source  => "puppet:///amp/client-cert.pem",
    }
    file { "/etc/amp/client-privkey.pem":
        ensure  => file,
        mode    => 0644,
        owner   => root,
        group   => root,
        source  => "puppet:///amp/client-privkey.pem",
    }

    service { "amp":
        ensure      => running,
        subscribe   => File["/etc/amp/collectors", "/etc/amp/nametable", "/etc/amp/schedule", "/etc/amp/ampnameprefix"],
        require     => Package["amp-client"],
        hasstatus   => false,
        hasrestart  => true,
        enable      => true,
    }
}
