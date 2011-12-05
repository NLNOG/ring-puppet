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
            content => template("syslog_ng/syslog-ng.conf.client.erb");
        "/etc/logrotate.d/syslog":
            source => "puppet:///modules/syslog_ng/syslog-logrotate";
    } # file
} # class syslog_ng::client
