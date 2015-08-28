# Configure logging
#log syslog { debug, trace, info, remote, warning, error, auth, fatal, bug };
#log stderr all;
#log "tmp" all;

router id <%= ipaddress %>; 

#mrtdump "/var/run/mrtdump6";
#mrtdump protocols all;

timeformat protocol iso long;

filter lookingglass_in {
    # prefer to expose non-AS23456 paths as primary path when available
    if (bgp_path.last = 23456) then {
        bgp_local_pref = 10;
    }

    # ignore defaults
    if (net = ::/0) then {
        reject;
    }

    accept;
}

template bgp peers {
    local as 199036;
    multihop;
    hold time 240;
    startup hold time 240;
    connect retry time 120;
    start delay time 5;             # How long do we wait before initial connect
    error forget time 0;            # ... until this timeout expires)
    source address <%= ipaddress6 %>;   # What local address we use for the TCP connection
    import filter lookingglass_in;
    export none;
}

<% scope.lookupvar('bird_peers::lg_peers_v6').each do |peers|
    peer = peers.split(',') %>
protocol bgp <%= peer[0] %> from peers {
    description "<%= peer[0] %>";
    neighbor <%= peer[1] %> as <%= peer[2] %>;
}

<% end %>
