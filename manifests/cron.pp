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

class pdnscronjobs {
    cron {
        "update-sshfp":
        command => "cat /etc/ssh/ssh_known_hosts | sed -e 's/^\w*,//' > /tmp/sshfp.$$ && sshfp -k /tmp/sshfp.$$ -a | ring-pdns update sshfp >/dev/null && rm /tmp/sshfp.$$",
        user => root,
        minute => "04",
        hour => "04",
        ensure => present,
    }
    cron {
        "regenerate-txt":
        command => "/usr/local/bin/ring-pdns regenerate txt 3>&1 1>/dev/null 2>&3 | grep -v NSEC 3>&1 1>&2 2>&3",
        user => root,
        minute => "04",
        hour => "04",
        ensure => present,
    }
}

class nodesonlycron {
}

# this class is executed on all ring-nodes including the master 
class cronjobs {
    $first = fqdn_rand(30)
    $second = (fqdn_rand(30) + 30)
    $minute = fqdn_rand(60)
    $cron1 = (fqdn_rand(50) + 1)
    $cron2 = (fqdn_rand(50) + 5)
    $cron3 = (fqdn_rand(50) + 3)

    cron { update_motd:
        command => "run-parts --lsbsysinit /etc/update-motd.d > /var/run/motd",
        hour => "7",
        minute => "15",
        user => "root",
    }

    cron { aptupdate:
        command => "apt-get update > /dev/null 2>&1",
        hour => "3",
        user => "root",
        minute => $cron1,
        environment => ["PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin"],
    }

    if str2bool(fqdn_rand(1)) {
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

    cron {
        "nodesjsonfetcher":
        command => "/usr/local/bin/ring-fetch-nodes-json",
        user    => root,
        minute  => $second,
        require => File["/usr/local/bin/ring-fetch-nodes-json"],
    }
}
