class mysql::config::performance::huge {
  mysql::config {
    'key_buffer':                      value  => '384M';
    'max_allowed_packet':              value  => '1M';
    'table_cache':                     value  => '512';
    'sort_buffer_size':                value  => '2M';
    'read_buffer_size':                value  => '2M';
    'read_rnd_buffer_size':            value  => '8M';
    'net_buffer_length':               value  => '8K';
    'myisam_sort_buffer_size':         value  => '64M';
    'thread_cache_size':               value  => '8';
    'query_cache_size':                value  => '32M';
    'thread_concurrency':              value  => '8';
    'thread_stack':                    ensure => absent;
    'isamchk/key_buffer':              value  => '256M';
    'isamchk/sort_buffer_size':        value  => '256M';
    'isamchk/read_buffer':             value  => '2M';
    'isamchk/write_buffer':            value  => '2M';
    'myisamchk/key_buffer':            value  => '256M';
    'myisamchk/sort_buffer_size':      value  => '256M';
    'myisamchk/read_buffer':           value  => '2M';
    'myisamchk/write_buffer':          value  => '2M';
  }
}
