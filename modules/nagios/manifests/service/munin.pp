define nagios::service::tcp_munin {
    nagios::service { "tcp_munin":
            check_command => "check_sobby!${ipaddr}!${port}";
   }
}

