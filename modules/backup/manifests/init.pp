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
        ensure  => present.

    }
    Line <<| tag == "backup_target" |>>

}

class backup::client {

    @@line { "candidate_backup_target":
        file    => "/backups/backup-hosts",
        line    => "${fqdn}",
        tag     => "backup_target",
        ensure  => present,
    }

    line { "backuphost_auth_v6":
        file => "/root/.ssh/authorized_keys",
        line => 'command="rdiff-backup --server --restrict-read-only /",from="2a00:f10:122::35",no-port-forwarding,no-X11-forwarding,no-pty ssh-dss AAAAB3NzaC1kc3MAAACBAIdjxztewpmrPvnGfGW/z+Mvxm/nqhI9g5mOz0o2vYAQT7fg8m59Aq07Dfm9bFZoL2sQfCjO3L6QrIeA9Mlbameqbi/laUm5l6xQ1AH5PW/MaIKnicY3kSJbUGYACPz6pSAmpgpaF0PMd4OixFCzfZFNgN5b967h+N8bd8AZlerBAAAAFQDpXKP+Nq98Ss2GiBSWS7Z+ZCloOwAAAIAn66A1amgH75tBLbWOc1S2ce4A0dc32Rc5d3WWtMB4CKg5iBAGGBh/rsAYjP1Y1emZl963QCNz2qIXQxgeJfCQTAuhnmVG+DYYKDasnCSy1VZvhNXW/LWpJqhqdjpHT2MITO7i4bE0uHW7uMrMGxVKM9+9U2v048ISqaG5Ux480AAAAIBaZcMy1fLDtxfpR/lxwhz9G+lcYCQDSJKkHBoq2xNUob0jcWAdIkcDXtsoeHlDLH+Yiv9pbR2Vbn9/91Zqhzc3ZsFUTfGcMo06SGOw2zE91VNoXTNOyRZfnZJk1tRy+mFhQtKGBiioSgjC+v6yyZ8KhLPmnnhjb++dimCLNufAGg== backup@backup.infra.ring.nlnog.net',
        ensure => absent,
}

    line { "backuphost_auth_v4":
        file => "/root/.ssh/authorized_keys",
        line => 'command="rdiff-backup --server --restrict-read-only /",from="109.72.93.35",no-port-forwarding,no-X11-forwarding,no-pty ssh-dss AAAAB3NzaC1kc3MAAACBAIdjxztewpmrPvnGfGW/z+Mvxm/nqhI9g5mOz0o2vYAQT7fg8m59Aq07Dfm9bFZoL2sQfCjO3L6QrIeA9Mlbameqbi/laUm5l6xQ1AH5PW/MaIKnicY3kSJbUGYACPz6pSAmpgpaF0PMd4OixFCzfZFNgN5b967h+N8bd8AZlerBAAAAFQDpXKP+Nq98Ss2GiBSWS7Z+ZCloOwAAAIAn66A1amgH75tBLbWOc1S2ce4A0dc32Rc5d3WWtMB4CKg5iBAGGBh/rsAYjP1Y1emZl963QCNz2qIXQxgeJfCQTAuhnmVG+DYYKDasnCSy1VZvhNXW/LWpJqhqdjpHT2MITO7i4bE0uHW7uMrMGxVKM9+9U2v048ISqaG5Ux480AAAAIBaZcMy1fLDtxfpR/lxwhz9G+lcYCQDSJKkHBoq2xNUob0jcWAdIkcDXtsoeHlDLH+Yiv9pbR2Vbn9/91Zqhzc3ZsFUTfGcMo06SGOw2zE91VNoXTNOyRZfnZJk1tRy+mFhQtKGBiioSgjC+v6yyZ8KhLPmnnhjb++dimCLNufAGg== backup@backup.infra.ring.nlnog.net',
        ensure => absent,

}
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
