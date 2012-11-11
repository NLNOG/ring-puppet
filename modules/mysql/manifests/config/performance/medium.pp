class mysql::config::performance::medium {
  mysql::config {
    'key_buffer':                      value  => '16M';
    'max_allowed_packet':              value  => '1M';
    'table_cache':                     value  => '64';
    'sort_buffer_size':                value  => '512K';
    'read_buffer_size':                value  => '256K';
    'read_rnd_buffer_size':            value  => '512K';
    'net_buffer_length':               value  => '8K';
    'myisam_sort_buffer_size':         value  => '8M';
    'thread_cache_size':               ensure => absent;
    'query_cache_size':                ensure => absent;
    'thread_concurrency':              ensure => absent;
    'thread_stack':                    ensure => absent;
    'isamchk/key_buffer':              value  => '20M';
    'isamchk/sort_buffer_size':        value  => '20M';
    'isamchk/read_buffer':             value  => '2M';
    'isamchk/write_buffer':            value  => '2M';
    'myisamchk/key_buffer':            value  => '20M';
    'myisamchk/sort_buffer_size':      value  => '20M';
    'myisamchk/read_buffer':           value  => '2M';
    'myisamchk/write_buffer':          value  => '2M';
  }
}
