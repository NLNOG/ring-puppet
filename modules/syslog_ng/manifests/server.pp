# Class: syslog_ng::server
#
# syslog servers
#
class syslog_ng::server inherits syslog_ng {

    file {
         "/etc/syslog-ng/syslog-ng.conf":
            ensure => present,
            notify => Service["syslog-ng"],
            source => "puppet:///modules/syslog_ng/syslog-ng.conf.server";
        "/var/log/HOSTS":
            ensure => directory,
            mode   => "755";
    } # file

    cron { "compress-logfiles":
        command => "/usr/bin/find /var/log/HOSTS -type f -! -name '*bz2' -mtime +3 -print0 | /usr/bin/xargs -0 /bin/bzip2 -9 &",
        user    => "root",
        hour    => "0",
        minute  => "0";
    } # cron

    file {                                                                      
        "/etc/init.d/syslog-ng":                                                
        owner   => root,                                                        
        group   => root,                                                        
        mode    => 0755,                                                        
        source  => "puppet:///files/etc/init.d/syslog-ng",                      
    }

} # class::syslog_ng::server
