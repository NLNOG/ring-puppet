class cronjobs {
    cron { aptupdate:
        command => "apt-get update",
        hour => "3",
        minute => "33",
        user => "root",
    }
    
    $first = fqdn_rand(30)
    $second = fqdn_rand(30) + 30
    cron {
        "puppetagent":
        command => "/usr/sbin/puppetd --test 2>&1 >>/dev/null",
        user => root,
        minute => [ $first, $second ],
    }

}
