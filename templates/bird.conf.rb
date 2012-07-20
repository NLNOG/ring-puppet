# Configure logging
#log syslog { debug, trace, info, remote, warning, error, auth, fatal, bug };
#log stderr all;
#log "tmp" all;

router id <%= ipaddress %>; 

template bgp peers {
    local as 199036;
    multihop;
    hold time 240;
    startup hold time 240;
    connect retry time 120;
    keepalive time 80;              # defaults to hold time / 3
    start delay time 5;             # How long do we wait before initial connect
    error wait time 60, 300;        # Minimum and maximum time we wait after an error (when consecutive
                                    # errors occur, we increase the delay exponentially ...
    error forget time 300;          # ... until this timeout expires)
    disable after error;            # Disable the protocol automatically when an error occurs
    source address <%= ipaddress %>;   # What local address we use for the TCP connection
    import all;
    export none;
}

protocol bgp BIT1 from peers {
    description "BIT1";
    neighbor 213.136.1.132 as 12859;
}
