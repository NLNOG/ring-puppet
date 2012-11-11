class rubygems::highline {
  require rubygems
  package{'ruby-highline':
    ensure => present,
  }
}
