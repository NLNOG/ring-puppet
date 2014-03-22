#
# Class: deckard
#
# Manages deckard monitoring service
#
# Server:
# include deckard::server
#
# Client:
# include deckard::node
#

class deckard::node {

    service { "deckard-node":
        ensure     => running,
        hasrestart => true,
    }

    file { "/etc/init.d/deckard-node":
        mode    => 755,
        ensure  => present,
        source  => "puppet:///deckard/init.d/deckard-node"
    }
    file { "/etc/deckardnode/scripts/ping.sh":
        mode    => 755,
        ensure  => present,
        source  => "puppet:///deckard/scripts/ping.sh"
    }
    file { "/usr/local/lib/python3.2/dist-packages/deckardnode/deckardnode.py":
        mode    => 755,
        ensure  => present,
        source  => "puppet:///deckard/deckardnode.py"
    }
    file { "/usr/local/lib/python3.2/dist-packages/deckardnode/__init__.py":
        mode    => 644,
        ensure  => present,
        source  => "puppet:///deckard/__init__.py"
    }
    file { "/usr/local/bin/deckard-node":
        mode    => 755,
        ensure  => present,
        source  => "puppet:///deckard/deckard-node"
    }

    file { 'deckard_scripts':
        path => '/etc/deckardnode/scripts/',
        ensure => directory,
        mode   => 0644,
        recurse => false,
    }
    file { 'deckard_module':
        path => '/usr/local/lib/python3.2/dist-packages/deckardnode',
        ensure => directory,
        mode   => 0644,
        recurse => false,
    }

}
