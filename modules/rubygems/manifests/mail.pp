class rubygems::mail {
  require rubygems::devel
  package{'mail':
    ensure => present,
    provider => gem,
  }

  if $rubyversion == '1.8.6' {
    require rubygems::tlsmail
  }
}
