# Class: syslog_ng::client
#
# All hosts are clients - included by generic module
#
# Requires:
#   $logServerList must be set in site manifest
#
class syslog_ng::client inherits syslog_ng {

    file { 
        "/etc/syslog-ng/syslog-ng.conf":
            notify  => Service["syslog-ng"],
            content => template("syslog_ng/syslog-ng.conf.client.erb.${lsbdistcodename}");
    }

    file {
        "/etc/logrotate.d/syslog-ng":
            owner   => root,
            group   => root,
            mode    => 0755,
            source => "puppet:///modules/syslog_ng/syslog-logrotate";
    }

    file {
        "/etc/init.d/syslog-ng":
        owner   => root,
        group   => root,
        mode    => 0755,
        source  => "puppet:///files/etc/init.d/syslog-ng",
    }

    file {
        "/etc/default/syslog-ng":
        owner   => root,
        group   => root,
        mode    => 0644,
        notify => Service["syslog-ng"],
        source  => "puppet:///files/etc/default/syslog-ng",
    }

} # class syslog_ng::client
