class nagios::defaults {

    # include some default nagios objects

    include nagios::defaults::commands
    include nagios::defaults::contactgroups
    include nagios::defaults::contacts
    include nagios::defaults::hostgroups
    include nagios::defaults::hostescalations
    include nagios::defaults::servicegroups
    include nagios::defaults::serviceescalations
    include nagios::defaults::templates
    include nagios::defaults::timeperiods
#    include nagios::defaults::plugins
}
