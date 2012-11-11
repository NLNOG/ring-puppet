class nagios::headless {
    $nagios_httpd = 'absent'
    include nagios

    resources { [ "nagios_service", "nagios_servicegroup", "nagios_host" ]:
        purge => true;
    }

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
}
