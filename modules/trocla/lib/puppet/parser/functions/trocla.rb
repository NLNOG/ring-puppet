module Puppet::Parser::Functions
  newfunction(:trocla, :type => :rvalue, :doc => "
This will create or get a random password from the trocla storage.

Usage:

    $password_user1 = trocla(key,[format='plain'[,options={}]])

Means:

    $password_user1 = trocla('user1')

Create or get the plain text password for the key 'user1'

    $password_user2 = trocla('user2','mysql')

Create or get the mysql style sha1 hashed password.

    $options_user3 = { 'username' => 'user3' } # Due to a puppet bug
                                               # this needs to be assigned
                                               # like that.
    $password_user3 = trocla('user3','pgsql', $options_user3)

Options can also be passed as a yaml string:

    $password_user3 = trocla('user3','pgsql', \"username: 'user3'\")
  "
  ) do |*args|
    require File.dirname(__FILE__) + '/../../util/trocla_helper'
    
    Puppet::Util::TroclaHelper.trocla(:password,true,*args)
  end
end
