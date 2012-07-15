define nagios::service::ssh(
    $ensure = present
){

    # Only add if we have v4
    if $::netmask != undef {
        nagios::service{ "check_ssh4":
            ensure => $ensure,
            check_command => "check_ssh_4",
            servicegroups => "ssh,ipv4",
        }
    }

    nagios::service{ "check_ssh6":
        ensure => $ensure,
        check_command => "check_ssh_6",
        servicegroups => "ssh,ipv6",
    }
}
