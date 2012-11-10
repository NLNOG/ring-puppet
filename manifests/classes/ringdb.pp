class collect_ringdb {

    @@file { "/var/ring/ring.sqlite":
        tag     => "ringdb",
        group   =>  "ring-admins",
    }
}

class distribute_ringdb {
    File <<| tag == "ringdb" |>>
}
        
