class cronjobs {
    cron { aptupdate:
        command => "apt-get update",
        hour => "3",
        minute => "33",
        user => "root",
    }
}
