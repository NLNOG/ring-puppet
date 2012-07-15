# manifests/target.pp

class nagios::target {

    case $hostname {
      /^(master|container|worker)/: { $use = 'critical-host' }
      default: { $use = 'generic-host' }
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
