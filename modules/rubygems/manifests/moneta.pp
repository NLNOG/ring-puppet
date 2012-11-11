class rubygems::moneta {
  require rubygems
  package{'libmoneta-ruby1.8':
    ensure => present,
    provider => apt,
  }
}
