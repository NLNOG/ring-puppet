# manifests/target.pp

class nagios::target {

    @@nagios_host { "${fqdn}":
        address => $ipaddress,
        alias => $hostname,
        use => 'generic-host',
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
