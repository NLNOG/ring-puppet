class nagios::defaults::contacts {

    nagios_contact {
        'generic-contact':
            alias                           => 'Generic Contact',
            service_notification_period     => '24x7',
            host_notification_period        => '24x7',
            service_notification_options    => 'w,u,c,r',
            host_notification_options       => 'd,r',
            service_notification_commands   => 'notify-service-by-email',
            host_notification_commands      => 'notify-host-by-email',
            register                        => '0',
        }

    nagios_contact {
        'ring-admins':
        alias                               => 'Ring Admins',
        email                               => 'ring-admins@ring.nlnog.net',
        use                                 => 'generic-contact',
    }

    nagios_contact {
        'ircbot':
            alias                           => 'IRC Bot',
            service_notification_period     => '24x7',
            host_notification_period        => '24x7',
            service_notification_options    => 'w,u,c,r',
            host_notification_options       => 'd,r',
            service_notification_commands   => 'notify-by-irc',
            host_notification_commands      => 'host-notify-by-irc',
    }

}
