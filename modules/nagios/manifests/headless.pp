class nagios::headless {
    $nagios_httpd = 'absent'
    include nagios

    nagios_servicegroup {
      'ping':
        alias   => 'All ICMP Services';
    }
    nagios_servicegroup {
      'ssh':
        alias   => 'All SSH Services';
    }
    nagios_servicegroup {
      'ipv4':
        alias   => 'All IPv4 Services';
    }
    nagios_servicegroup {
      'ipv6':
        alias   => 'All IPv6 Services';
    }

    cron { "remove_old_nagios":
        command => "rm /etc/nagios3/conf.d/nagios_host.cfg /etc/nagios3/conf.d/nagios_service.cfg /etc/nagios3/conf.d/nagios_servicedependency.cfg > /dev/null 2>&1",
        user => root,
        hour => "4",
        minute => 00,
        ensure => present,
    }
}
