class scamper {

    cron { "collect_all_traces":
        user => "scamper",
        command => "/home/scamper/run-traces.sh",
        ensure => absent,
    }

    cron { "clean_scamper":
        user => "scamper",
        command => "find /home/scamper/collected/* -mtime +8 -exec rm {} \\;",
        ensure => absent,
    }

}
