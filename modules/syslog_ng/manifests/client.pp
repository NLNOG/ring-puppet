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
            content => $lsbdistcodename ? {
                maverick    => template("syslog_ng/syslog-ng.conf.client.erb.maverick"),
                precise     => template("syslog_ng/syslog-ng.conf.client.erb.precise"),
            }
        "/etc/logrotate.d/syslog-ng":
        owner   => root,
        group   => root,
        mode    => 0755,
            source => "puppet:///modules/syslog_ng/syslog-logrotate";
    } # file

    file {
        "/etc/init.d/syslog-ng":
        owner   => root,
        group   => root,
        mode    => 0755,
        source  => "puppet:///files/etc/init.d/syslog-ng",
    }

} # class syslog_ng::client
