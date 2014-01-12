# Configure logging
#log syslog { debug, trace, info, remote, warning, error, auth, fatal, bug };
#log stderr all;
#log "tmp" all;

router id <%= ipaddress %>; 

#mrtdump "/var/run/mrtdump4";
#mrtdump protocols all;

timeformat protocol iso long;

template bgp peers {
    local as 199036;
    multihop;
    hold time 240;
    startup hold time 240;
    connect retry time 120;
    keepalive time 80;              # defaults to hold time / 3
    start delay time 5;             # How long do we wait before initial connect
    error forget time 0;            # ... until this timeout expires)
    source address <%= ipaddress %>;   # What local address we use for the TCP connection
    import all;
    export none;
}

<% scope.lookupvar('bird_peers::lg_peers_v4').each do |peers|
    peer = peers.split(',') %>
protocol bgp <%= peer[0] %> from peers {
    description "<%= peer[0] %>";
    neighbor <%= peer[1] %> as <%= peer[2] %>;
}

<% end %>

