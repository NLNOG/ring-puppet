# Class: trocla::master::ree
#
# This module manages the necessary things for trocla on a master.
#
# [Remember: No empty lines between comments and class definition]
class trocla::master::ree {

  require ruby-enterprise::gems::moneta
  require ruby-enterprise::gems::highline
  
  ruby-enterprise::gem{'trocla': }
}
