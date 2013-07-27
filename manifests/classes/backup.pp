class backup {
    line { 'backup_rsa_key':
        file    => '/root/.ssh/authorized_keys',
        line    => 'from="109.72.93.35,2a00:f10:122::35",command="/root/validate-rsync-backup" ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCtuDpNbJ49G9HXXgJShC9JKJadzbtAzaLFLEbU1tQ2MZiSIMQhKdjulkCPcEAExMJDoQPGuNNiJjTkQdSLQMTZepZyQm0WyWN5xl4DfmAdaWrntd3k4BLdLESPzxdMMbVwneNm6+FtIMNbPWxETrDRY+bBuJ4nV4HZrRxW4JF4NUBueDV5hlJus90dAik63c7oQ2TuAa8bWoFbD111YZLgAHksz3cw//aqwbqKAxsnO8Gh1BRk6nzbslBabjbDN/Metdwv9yY0aeitLzwtMIbRYQPgqBdZ8Euw8bZTaIE9ei7gx0ePv9MEtZ4P6ZvpeUNnm/tiL74tp6cVGd2OY3G7 root@backup.infra.ring.nlnog.net',
        ensure  => present,
    }

    file { '/root/validate-rsync-backup':
        source  => 'puppet:///files/root/validate-rsync-backup',
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
    }
}
