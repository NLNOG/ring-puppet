class backup {
    line { 'backup_rsa_key':
        file    => '/root/.ssh/authorized_keys',
        line    => 'from=109.72.93.35,2a00:f10:122::35,command="/root/validate-rsync-backup" ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDXjzREHzv18qBiZxrTRmcU7ROveer15NQOhUw+juZBQcJXTypI5zz+fRRjjZrA8WXPVRzMl2z/R/EeugvE3hRpFs/F9ToTNP0RYvdI9yEzvl5UzvPdjQX2MtxRh8Cz+APkV8y6bLUpkceG1tdu4A3OHcrz3QlOkxffTgrHZxlF2Klk+L4i4uEGpqjESA70/WEp7sW+AIvwodR7F1GGoqTglswMtf0trIfH57vvWBqsx7ERKbNsUvouzsGSvlSSdRF1gHv86H3LmV6JRergON+wnZi+XQ9v8imsIXxmxBoMZMjFTbRL8MRnHka05r1ZZtlk/yn8u05TqB4y6L2I+4uH backup@backup.infra.ring.nlnog.net',
        ensure  => present,
    }
}
