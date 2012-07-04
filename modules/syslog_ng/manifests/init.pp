# Class: syslog_ng
#
# This module manages syslog-ng
# 
# There are two main pices:  client and server
#   client goes everywhere
#   server goes on the central logging hosts.
#
# syslog_ng is a generic class that is
# inherited by either client or server
#
class syslog_ng {

    package { "syslog-ng": 
        ensure => latest,
    } # package

    service { "syslog-ng":
        enable  => true,
        ensure  => running,
        require => Package["syslog-ng"],
        subscribe => File["/etc/syslog-ng/syslog-ng.conf"],
    } # service

    File { require => Package["syslog-ng"] }

    file { "/etc/syslog-ng":
        ensure => directory,
        mode   => "755";
    } # file

} # class syslog_ng
