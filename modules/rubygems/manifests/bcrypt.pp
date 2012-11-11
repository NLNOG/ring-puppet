class rubygems::bcrypt {
  require rubygems
  package{'bcrypt-ruby':
    ensure => present,
    provider => gem,
  }
}
