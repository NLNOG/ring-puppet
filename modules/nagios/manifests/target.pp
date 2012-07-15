# manifests/target.pp

class nagios::target (
    $use = 'generic-host' )
{

    case $hostname {
      /^master/: { $use = 'critical-host' }
    }

    @@nagios_host { "${fqdn}":
        address => $ipaddress,
        alias => $hostname,
        use => $use,
    }

    if ($location != '') {
        Nagios_host["${fqdn}"] {
            notes => "latlng: ${location}",
        }
    }

    if ($nagios_parents != '') {
        Nagios_host["${fqdn}"] { parents => $nagios_parents }
    }

}
