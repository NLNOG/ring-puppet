define nagios::service::tcpmunin {
    
    nagios::service { "tcp_munin":
            check_command => "check_sobby!${host}!4949";
   }
}

