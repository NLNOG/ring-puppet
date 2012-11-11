module Puppet::Parser::Functions
  newfunction(:trocla_get, :type => :rvalue, :doc => "
  This will only get an already stored password from the trocla storage.

Usage:

    $password_user1 = trocla_get(key,[format='plain'])

Means:

    $password_user1 = trocla('user1')

Get the plain text password for the key 'user1'

    $password_user2 = trocla_get('user2','mysql')

Get the mysql style sha1 hashed password.

It will raise a parse error if the password haven't yet been stored in trocla.
"
  ) do |*args|
    require File.dirname(__FILE__) + '/../../util/trocla_helper'
    if (answer=Puppet::Util::TroclaHelper.trocla(:get_password,false,*args)).nil?
      raise(Puppet::ParseError, "No password for key,format #{args.flatten.inspect} found!")
    end
    answer
  end
end
