class backup::server {

    package { 'linux-headers-virtual':
        ensure  => latest,
    }

# broken due to puppet -> ansible migration
#    apt::ppa { 'ppa:zfs-native/stable': 
#        before  => Package["ubuntu-zfs"],
#    }

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
        line    => 'from="109.72.93.35,2a00:f10:122::35",command="/root/validate-rsync-backup" ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC9zR9lQ7mr8aWhAzJBUhbTCg6RaMR0aSIpafvXjNiCzZg1yO+QOkw8N8i0lwyxND5xHiT4pgaL4ILqJ7SefocIU9MgcY77YUFHzkpOFjGpSF8I0nY4Q0WlYC0XFJvO4hx7sUXFBQze55Xbe4OBEEJoKCBbfCXEwgiPobXrcKSoCjT49hcz4F3q5MxEHgu1wvXzG7eiOyCtsNW5T/I5vImt0usP7SKGBBnWLZY92pfbtmqDwZ1q1joaM/qADO0E1YiXTL8QTtuhG5PMC8khAjZ9AzljaMi9UX1vjKWG7DL6VVSTv6nI1GNLABg8/Cwq69Dujho6zezWOANega6mEhzh root@backup.infra.ring.nlnog.net',
        ensure  => present,
    }

    line { 'backup02_rsa_key':
        file    => '/root/.ssh/authorized_keys',
        line    => 'from="165.254.255.19,2001:728:1808::19",command="/root/validate-rsync-backup" ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDhqCJ5ep0oV9U+EirJVHDfqcpdqyDwMgKMcUiat5n62n5H9/oB7/q1A+QNYNWSKxWF9bfU+SwsO2p940AMoYdl9vxLi99mVAvE++pltSKm72KiEyVoasjq3BBHzn37W3nBg86Iqi7QEaH1pgVOIA+LRDesphRXih+4SfrPmAvg1jMfEN39iXDc2kQ+x2sqBy+Z17zd5y5nphBbE8tQK9Wr4eXk17ULtnkg6OpHcMhX8Zo/Khwqb5NC+ShfY2OPKYaSEjWSB+owXo5EWfaLCB6CWxXH/OhAheMaFOHuSz/3ZATQEBAS6h9bESIaTyZ20K7bn5taoDxs0UzernfiXfiJ root@backup02.infra.ring.nlnog.net',
        ensure  => absent,
    }

    line { 'storage01_rsa_key':
        file    => '/root/.ssh/authorized_keys',
        line    => 'from="52.18.186.201,2a01:578:3::3412:bac9",command="/root/validate-rsync-backup" ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDPbHCX7dsU6DlTxOCCh5+f+OxDTuuaIkrckgFX6/boqtkdeKzDIOmKfO+QNvngcJvwSQ0fcwd41ijq0xdy8LKeNP59nyOHyd7s4ZVK4whVWBGwh3D0zWvfXmhycaEwPV/9lGEyqSJ7+GNHkQmIxcZwg5BT/Y+AnWv5FDRnJNbxRm9Va7PMnq5/vSdCRc8LNZFkpiUz6w9KQPEMulBEuYVNo2PvbDWLhuZVpNKMEmE+5kRxK9/OOQ4SZnU3LKQEQsJfEtKjafeYvSDsQgq0ZOsgWVk1sXwTeaUWuCPQRzX2APxCubJLHduUC9GTanefTohcuYNYCn/98rZ+JUD0qjSp root@storage01.infra.ring.nlnog.net',
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
