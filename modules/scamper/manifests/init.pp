class scamper {

    cron { "collect_all_traces":
        ensure => absent,
        user => scamper,
    }

    cron { "clean_scamper":
        ensure => absent,
        user => root,
    }

}
