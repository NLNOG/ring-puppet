# Class: trocla::master
#
# This module manages the necessary things for trocla on a master.
#
# [Remember: No empty lines between comments and class definition]
class trocla::master {

  require rubygems::moneta
  require rubygems::highline
  
  package{'trocla':
      ensure   => present,
      provider => gem,
  }
}
