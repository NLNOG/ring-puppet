# Class cronjobs
# Provides: mastercronjobs, nodesonlycron, cronjobs
#
class mastercronjobs {
    cron { pull_from_repo:
        command => "/usr/local/bin/ring-puppet-repo-sync > /dev/null 2>&1",
        minute  => "*/5",
        user    => root,
        ensure  => present,
    }
    cron { correlate_sqa:
        command => "/var/www/ring.nlnog.net/sqa_collector/sqa_correlator.py",
        minute  => "*/3",
        user    => root,
        ensure  => present,
    }
}

# Ugly workaround to keep IPv6 on VMs alive
class containercronjobs {
    cron { flush_ipv6_cache:
        command => "/sbin/ip -6 route flush cache > /dev/null 2>&1",
        minute  => "*/2",
        user    => root,
        ensure  => present,
    }
}

# this class is executed on all ring-nodes including the master 
class cronjobs {
    $first = fqdn_rand(30)
    $second = (fqdn_rand(30) + 30)
    $minute = fqdn_rand(60)
    $cron1 = (fqdn_rand(50) + 1)

    if str2bool(fqdn_rand(2)) {
        $agent_hour = "*/2"
    } else {
        $agent_hour = "1-23/2"
    }

   cron {
        "puppetagent":
        command => "/usr/sbin/puppetd --test > /dev/null 2>&1",
        user => root,
        minute => "$minute",
        hour   => "$agent_hour",
    }
    
    cron {
        "zombiekiller":
        command => "/usr/local/bin/puppet_zombiecleanup > /dev/null 2>&1",
        user => root,
        minute => "42",
    }
}
