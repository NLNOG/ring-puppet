class rubygems::highline {
  require rubygems
  package{'rubygem-highline':
    ensure => present,
  }
}
