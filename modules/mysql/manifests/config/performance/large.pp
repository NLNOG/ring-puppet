class mysql::config::performance::large {
  mysql::config {
    'key_buffer':                      value  => '256M';
    'max_allowed_packet':              value  => '1M';
    'table_cache':                     value  => '256';
    'sort_buffer_size':                value  => '1M';
    'read_buffer_size':                value  => '1M';
    'read_rnd_buffer_size':            value  => '4M';
    'net_buffer_length':               value  => '8K';
    'myisam_sort_buffer_size':         value  => '64M';
    'thread_cache_size':               value  => '8';
    'query_cache_size':                value  => '16M';
    'thread_concurrency':              value  => '8';
    'thread_stack':                    ensure => absent;
    'isamchk/key_buffer':              value  => '128M';
    'isamchk/sort_buffer_size':        value  => '128M';
    'isamchk/read_buffer':             value  => '2M';
    'isamchk/write_buffer':            value  => '2M';
    'myisamchk/key_buffer':            value  => '128M';
    'myisamchk/sort_buffer_size':      value  => '128M';
    'myisamchk/read_buffer':           value  => '2M';
    'myisamchk/write_buffer':          value  => '2M';
  }
}
