class rubygems::maildir {
  require rubygems::devel
  package{'maildir':
    ensure => present,
    provider => gem,
  }
}
