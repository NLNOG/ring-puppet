class backup::server {

    package { 'linux-headers-virtual':
        ensure  => latest,
    }

    apt::ppa { 'ppa:zfs-native/stable': 
        before  => Package["ubuntu-zfs"],
    }

    package { 'ubuntu-zfs':
        ensure  => latest,
        require => Package['linux-headers-virtual'],
    }

    file { '/var/lib/syslog-ng':
        ensure  => directory,
    }

    file { '/backups/backup-hosts':
        ensure  => present,
    }

    Line <<| tag == "backup_target" |>>

}

class backup::client {

    @@line { "candidate_backup_target_${fqdn}":
        file    => "/backups/backup-hosts",
        line    => "${fqdn}",
        tag     => "backup_target",
        ensure  => present,
    }

    line { 'backup_rsa_key':
        file    => '/root/.ssh/authorized_keys',
        line    => 'from="109.72.93.35,2a00:f10:122::35",command="/root/validate-rsync-backup" ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDGpE8I94KX3IWr0URK6DleZvf8d6+3g+3xzfCP+pLQ/TqdRT6ym46AqlDyj5E51tPE3ybW9zXNBd/ynaIQ8rAPzETkYu7OStYTN3253VnLDbxdDcAbLanNWaEn0pMOyJSARQhmIjq04X/ybssM72s069U/+TncTRNKrGfRiBIuv0RKT+NkMRkRto4Goe5DvI2xNviwYVauT5N6JZMJAG2wQpHPZ4MyheI8387Qvk8Ro4YPVCO3+vUiL/1G+yMqILpJL2li9+rHMXKUZ24qERZUP4G7tzY2v4KP4NofkkjaQJWPoQfE+5/SUfU8KNtkv4nhL5/HhZBrgfHKGxBo+ZW7 root@backup.infra.ring.nlnog.net',
        ensure  => present,
    }

    line { 'backup02_rsa_key':
        file    => '/root/.ssh/authorized_keys',
        line    => 'from="165.254.255.19,2001:728:1808::19",command="/root/validate-rsync-backup" ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDhqCJ5ep0oV9U+EirJVHDfqcpdqyDwMgKMcUiat5n62n5H9/oB7/q1A+QNYNWSKxWF9bfU+SwsO2p940AMoYdl9vxLi99mVAvE++pltSKm72KiEyVoasjq3BBHzn37W3nBg86Iqi7QEaH1pgVOIA+LRDesphRXih+4SfrPmAvg1jMfEN39iXDc2kQ+x2sqBy+Z17zd5y5nphBbE8tQK9Wr4eXk17ULtnkg6OpHcMhX8Zo/Khwqb5NC+ShfY2OPKYaSEjWSB+owXo5EWfaLCB6CWxXH/OhAheMaFOHuSz/3ZATQEBAS6h9bESIaTyZ20K7bn5taoDxs0UzernfiXfiJ root@backup02.infra.ring.nlnog.net',
        ensure  => present,
    }


    file { '/root/.ssh':
        ensure  => directory,
    }

    file { '/root/validate-rsync-backup':
        source  => 'puppet:///files/root/validate-rsync-backup',
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
    }
}
