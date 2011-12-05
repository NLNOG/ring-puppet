# this class is only executed on the master
class mastercronjobs {
    cron { pull_from_repo:
        command => "cd /etc/puppet/environments/production && /usr/bin/git pull  origin master  && /usr/bin/git reset  --hard && /usr/bin/git clean  -d -x -f && touch .puppet-sync-stamp 2>&1",
        minute  => "*/5",
        user    => root,
        ensure  => present,
    }
}

# this class is executed on all ring-nodes including the master 
class cronjobs {
    $first = fqdn_rand(30)
    $second = fqdn_rand(30) + 30

    cron { aptupdate:
        command => "apt-get update 2>&1 >>/dev/null",
        hour => "3",
        user => "root",
        minute => fqdn_rand(50) + 1,
        environment => ["PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin"],
    }
    
   cron {
        "puppetagent":
        command => "/usr/sbin/puppetd --test 2>&1 >>/dev/null",
        user => root,
        minute => [ $first, $second ],
    }
    
    cron {
        "reload-smokeping":
        command => "/usr/sbin/service smokeping restart 2>&1 >/dev/null",
        user => root,
        weekday => "*",
        hour => "3",
        minute => fqdn_rand(50) + 5,
        ensure => absent,
    }

# our munin module makes this useless
# see msp01 example in nodes.pp if you want to enable specific plugins on a host
    cron { "munin-configure":
        command => "/usr/sbin/munin-node-configure --shell | bash 2>&1 >>/dev/null",
        user => root,
        hour => "3",
        weekday => "1",
        minute => fqdn_rand(50) + 3,
        ensure => absent,
    }

}
