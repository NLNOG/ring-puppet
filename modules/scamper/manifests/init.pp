class scamper {

    cron { "collect_all_traces":
        ensure => absent,
    }

    cron { "clean_scamper":
        ensure => absent,
    }

}
