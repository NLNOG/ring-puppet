define nagios::service::dnssec::exp(
$dnsserver  =   'google-public-dns-a.google.com-v4',
$domain     =   'meerval.net',
$dns_ip     =   '8.8.8.8'
)   {
    nagios::service{ 
        "dnssec_exp_${dnsserver}_${domain}":
            check_command => "check_dnssec_exp!${dns_ip}!${domain}";
   }
}

define nagios::service::dnssec::trace(
$domain     =   'meerval.net'
)   {
    nagios::service{ 
    "dnssec_trace_${domain}":
            check_command    => "check_dnssec_trace!${domain}!127.0.0.1";
    }
}
