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

class nettools {
    package { "puppet": ensure => latest }
    package { "puppet-common": ensure => latest }
    package { "ruby1.9.3": ensure => latest }
    package { "ruby": ensure => latest }
    package { "members": ensure => latest }
    package { "libsqlite3-dev": ensure => latest }

    # for purgekernels
    package { ["libdpkg-perl", "libgetopt-simple-perl"]: ensure => latest }

    # for ring-curl
    package { ["libjson-perl"]: ensure => latest }
    # Install home-built version for openssl support)
    #package { ["libwww-curl-perl"]: version => '4.15-1build2-ring' }
    package { ["libwww-curl-perl"]: ensure => latest }

    # packages we don't like
    package { ["dhcp3-client", "dhcp3-common"]:
        ensure  => $hostname ? {
            'amazon01'  => latest,
            'amazon02'  => latest,
            'amazon03'  => latest,
            'amazon04'  => latest,
            'amazon05'  => latest,
            'amazon06'  => latest,
            default => purged,
        }
    }
}

class nlnogrepokey {

    apt::key { 'nlnog_ring_repo':
        key     => '37B0CA14',
        key_source  => "https://ring.nlnog.net/nlnogrepopublic.key",
    }

    apt::key { 'salt_repo_key':
        key     => 'DE57BFBE',
        key_source  => "https://repo.saltstack.com/apt/ubuntu/12.04/amd64/latest/SALTSTACK-GPG-KEY.pub",
    }
    
    apt::key { 'ansible_repo_key':
        key     => '7BB9C367',
        key_source  => "https://ring.nlnog.net/ansiblerepopublic.key",
    }

}

