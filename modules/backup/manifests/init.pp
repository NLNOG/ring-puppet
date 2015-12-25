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
        line    => 'from="109.72.93.35,2a00:f10:122::35",command="/root/validate-rsync-backup" ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC9zR9lQ7mr8aWhAzJBUhbTCg6RaMR0aSIpafvXjNiCzZg1yO+QOkw8N8i0lwyxND5xHiT4pgaL4ILqJ7SefocIU9MgcY77YUFHzkpOFjGpSF8I0nY4Q0WlYC0XFJvO4hx7sUXFBQze55Xbe4OBEEJoKCBbfCXEwgiPobXrcKSoCjT49hcz4F3q5MxEHgu1wvXzG7eiOyCtsNW5T/I5vImt0usP7SKGBBnWLZY92pfbtmqDwZ1q1joaM/qADO0E1YiXTL8QTtuhG5PMC8khAjZ9AzljaMi9UX1vjKWG7DL6VVSTv6nI1GNLABg8/Cwq69Dujho6zezWOANega6mEhzh root@backup.infra.ring.nlnog.net',
        ensure  => present,
    }

    line { 'backup02_rsa_key':
        ensure  => absent,
    }

    line { 'storage01_rsa_key':
        file    => '/root/.ssh/authorized_keys',
        line    => 'from="52.18.186.201,2a01:578:3::3412:bac9",command="/root/validate-rsync-backup" ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCxarwLTfTUNqCpnarpWHBU7Eig8sqZzUEeMiRKGACm2ZcQGlDgWvnDK5aAagM98lYLruBMtL4vfNGAvGmG0GU1bE+qQ+Uo2GShFh7iu0Pl7QVaP+7JcSwFeLZaQUwDnvJ3VSKrSFepHp94U/r9z13dzAWqP3KfnCbYjgn9FPjKMbgcRylHPr6dFklg3xbeVIzCac6y4bo9RHGmYRuakYmhBL77LywIU7t6Xys1+IYUq7RQaqn5mnX0NZjtT8IS9welkDaHxP44mca5yYK0EtzFUrB0EGA8pJWmQm3Kd85IbU+2L1M82UbCTDgnqNA2Fqn9ve3Z05aCPA6j8DhykTyV root@storage01.infra.ring.nlnog.net',
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
