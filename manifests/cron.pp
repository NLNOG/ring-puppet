class cronjobs {
    $first = fqdn_rand(30)
    $second = fqdn_rand(30) + 30

    cron { aptupdate:
        command => "apt-get update &> /dev/null",
        hour => "3",
        user => "root",
        minute => fqdn_rand(50) + 1,
    }
    
   cron {
        "puppetagent":
        command => "/usr/sbin/puppetd --test 2>&1 >>/dev/null",
        user => root,
        minute => [ $first, $second ],
    }
    
    cron {
        "reload-smokeping":
        command => "/usr/sbin/service smokeping restart",
        user => root,
        weekday => "*",
        hour => "3",
        minute => fqdn_rand(50) + 5,
    }

    cron { "munin-configure":
        command => "/usr/sbin/munin-node-configure --shell",
        user => root,
        hour => "3",
        weekday => "1",
        minute => fqdn_rand(50) + 3,
    }

}
