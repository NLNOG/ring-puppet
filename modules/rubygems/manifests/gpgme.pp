class rubygems::gpgme{
  require rubygems::devel
  require gpg::gpgme::devel

  package{'ruby-gpgme':
    ensure => present,
    provider => gem,
  }
}
