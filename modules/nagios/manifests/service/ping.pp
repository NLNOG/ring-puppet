define nagios::service::ping(
    $ensure = present
){
    $real_nagios_ping_rate = $nagios_ping_rate ? {
        '' => '!100.0,20%!500.0,60%',
        default => $nagios_ping_rate
    }

    nagios::service{ "check_ping6":
        ensure => $ensure,
        check_command => "check_ping6${real_nagios_ping_rate}",
        servicegroups => "ping,ipv6",
    }

    # Only add if we have v4
    if $::netmask != undef {
        nagios::service{ "check_ping":
            ensure => $ensure,
            check_command => "check_ping${real_nagios_ping_rate}",
            servicegroups => "ping,ipv4",
        }
    }
}
