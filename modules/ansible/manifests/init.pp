class ansible::master {

  file { '/var/ring':
      ensure => 'directory',
      owner  => 'root',
      group  => 'ring-admins',
      mode   => '2775',
  }
    
  cron { ansible_deploy:
        command => "chronic /usr/local/bin/ring-admin ansible deploy >/dev/null 2>/dev/null",
        minute  => "42",
        user    => ringforger,
        ensure  => present,
  }
  
  cron { ansible_report:
        command => "/usr/local/bin/ring-admin ansible report >/dev/null",
        hour    => "10",
        minute  => "22",
        user    => ringforger,
        ensure  => present,
  }

}
