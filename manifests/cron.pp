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

class pdnscronjobs {
    cron {
        "update-sshfp":
        command => "cat /etc/ssh/ssh_known_hosts | perl -pe 's/,[^ ]+//' | sed 's/.ring.nlnog.net//' > /tmp/sshfp.$$ && sshfp -k /tmp/sshfp.$$ -a | chronic ring-pdns update sshfp && rm /tmp/sshfp.$$",
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

class dbmastercronjobs {
    cron { 'node_down_reminders':
        user    => 'root',
        minute  => '28',
        hour  => '6',
        monthday => ['5,19'],
        command => '/usr/local/bin/ring-admin send downreminders >/dev/null',
        require => File['/usr/local/bin/ring-admin'],
    }
    cron { 'node_down_deactivation':
        user    => 'root',
        minute  => '28',
        hour  => '6',
        monthday => '27',
        command => '/usr/local/bin/ring-admin purge machines',
        require => File['/usr/local/bin/ring-admin'],
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

    file { "/etc/ring/":
        ensure => directory,
    }

    cron {
        "nodesjsonfetcher":
        command => "/usr/local/bin/ring-fetch-nodes-json",
        user    => root,
        minute  => $second,
        require => [File["/usr/local/bin/ring-fetch-nodes-json"], File["/etc/ring/"]],
    }

    cron {
        "list_of_nodes":
        command => "grep ring.nlnog /etc/hosts | grep -v infra.ring.nlnog | cut -d' ' -f1 | sort -V > /etc/ring/node-list.txt",
        user => root,
        minute => $second,
        require => File["/etc/ring/"],
    }
}
