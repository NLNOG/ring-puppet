class ansible::master {

  file { '/var/ring':
      ensure => 'directory',
      owner  => 'root',
      group  => 'ring-admins',
      mode   => '2770',
  }

  vcsrepo { '/var/ring/ansible':
      ensure   => present,
      provider => git,
      source   => 'git://example.com/repo.git',
  }

}

