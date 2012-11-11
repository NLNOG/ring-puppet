class mysql::config::performance::small {
  mysql::config {
    'key_buffer':                      value  => '16K';
    'max_allowed_packet':              value  => '1M';
    'table_cache':                     value  => '4';
    'sort_buffer_size':                value  => '64K';
    'read_buffer_size':                value  => '256K';
    'read_rnd_buffer_size':            value  => '256K';
    'net_buffer_length':               value  => '2K';
    'myisam_sort_buffer_size':         ensure => absent;
    'thread_cache_size':               ensure => absent;
    'query_cache_size':                ensure => absent;
    'thread_concurrency':              ensure => absent;
    'thread_stack':                    value  => '64K';
    'isamchk/key_buffer':              value  => '8M';
    'isamchk/sort_buffer_size':        value  => '8M';
    'isamchk/read_buffer':             ensure => absent;
    'isamchk/write_buffer':            ensure => absent;
    'myisamchk/key_buffer':            value  => '8M';
    'myisamchk/sort_buffer_size':      value  => '8M';
    'myisamchk/read_buffer':           ensure => absent;
    'myisamchk/write_buffer':          ensure => absent;
  }
}
