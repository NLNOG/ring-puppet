class backup::server {
    
    Cron <<| tag == rdiff |>>

}

class backup::client {

    line { "backuphost_auth_v6":
        file => "/root/.ssh/authorized_keys",
        line => 'command="rdiff-backup --server --restrict-read-only /",from="2a00:f10:122::35",no-port-forwarding,no-X11-forwarding,no-pty ssh-dss AAAAB3NzaC1kc3MAAACBAIdjxztewpmrPvnGfGW/z+Mvxm/nqhI9g5mOz0o2vYAQT7fg8m59Aq07Dfm9bFZoL2sQfCjO3L6QrIeA9Mlbameqbi/laUm5l6xQ1AH5PW/MaIKnicY3kSJbUGYACPz6pSAmpgpaF0PMd4OixFCzfZFNgN5b967h+N8bd8AZlerBAAAAFQDpXKP+Nq98Ss2GiBSWS7Z+ZCloOwAAAIAn66A1amgH75tBLbWOc1S2ce4A0dc32Rc5d3WWtMB4CKg5iBAGGBh/rsAYjP1Y1emZl963QCNz2qIXQxgeJfCQTAuhnmVG+DYYKDasnCSy1VZvhNXW/LWpJqhqdjpHT2MITO7i4bE0uHW7uMrMGxVKM9+9U2v048ISqaG5Ux480AAAAIBaZcMy1fLDtxfpR/lxwhz9G+lcYCQDSJKkHBoq2xNUob0jcWAdIkcDXtsoeHlDLH+Yiv9pbR2Vbn9/91Zqhzc3ZsFUTfGcMo06SGOw2zE91VNoXTNOyRZfnZJk1tRy+mFhQtKGBiioSgjC+v6yyZ8KhLPmnnhjb++dimCLNufAGg== backup@backup.infra.ring.nlnog.net',
        ensure => present,
        require => Package['rdiff-backup'],
}

    line { "backuphost_auth_v4":
        file => "/root/.ssh/authorized_keys",
        line => 'command="rdiff-backup --server --restrict-read-only /",from="109.72.93.35",no-port-forwarding,no-X11-forwarding,no-pty ssh-dss AAAAB3NzaC1kc3MAAACBAIdjxztewpmrPvnGfGW/z+Mvxm/nqhI9g5mOz0o2vYAQT7fg8m59Aq07Dfm9bFZoL2sQfCjO3L6QrIeA9Mlbameqbi/laUm5l6xQ1AH5PW/MaIKnicY3kSJbUGYACPz6pSAmpgpaF0PMd4OixFCzfZFNgN5b967h+N8bd8AZlerBAAAAFQDpXKP+Nq98Ss2GiBSWS7Z+ZCloOwAAAIAn66A1amgH75tBLbWOc1S2ce4A0dc32Rc5d3WWtMB4CKg5iBAGGBh/rsAYjP1Y1emZl963QCNz2qIXQxgeJfCQTAuhnmVG+DYYKDasnCSy1VZvhNXW/LWpJqhqdjpHT2MITO7i4bE0uHW7uMrMGxVKM9+9U2v048ISqaG5Ux480AAAAIBaZcMy1fLDtxfpR/lxwhz9G+lcYCQDSJKkHBoq2xNUob0jcWAdIkcDXtsoeHlDLH+Yiv9pbR2Vbn9/91Zqhzc3ZsFUTfGcMo06SGOw2zE91VNoXTNOyRZfnZJk1tRy+mFhQtKGBiioSgjC+v6yyZ8KhLPmnnhjb++dimCLNufAGg== backup@backup.infra.ring.nlnog.net',
        ensure => present,
        require => Package['rdiff-backup'],
}

    package { "rdiff-backup":
        ensure => latest,
    }

    @@cron { "backup_${name}":
        command => "rdiff-backup --exclude /proc --exclude /dev --exclude /sys root@${name}::/ /backups/${name}/",
        user => root,
        hour => [ fqdn_rand(12), fqdn_rand(12) + 12 ],
        minute => fqdn_rand(50),
        tag => 'rdiff',
    }
}
