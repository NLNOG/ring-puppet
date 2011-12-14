define nagios::service::ssh(
    $ensure = present
){

    nagios::service{ "check_ssh4":
        ensure => $ensure,
        check_command => "check_ssh_4",
    }

    nagios::service{ "check_ssh6":
        ensure => $ensure,
        check_command => "check_ssh_6",
    }
}
