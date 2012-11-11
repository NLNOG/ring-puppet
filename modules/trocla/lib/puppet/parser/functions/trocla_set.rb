module Puppet::Parser::Functions
  newfunction(:trocla_set, :type => :rvalue, :doc => "
  This will set a password/hash in the local storage and return itself,
  or hashed in another format, if the password is present in plaintext or
  in that specific hash format.

  This function is mainly useful to migrate from hashes in manifests to trocla only manifests.

Usage:

    $password_user1 = trocla_set(key,value,[format='plain',[return_format,[options={}]]])

Means:

    $password_user1 = trocla_set('user1','mysecret')

Will set and return 'mysecret' as plain password.

    $password_user2 = trocla_set('user2','*AAA...','mysql')

Will set and return the sha1 hashed mysql password for the key user2.

    $password_user3 = trocla_set('user3','mysecret','plain','sha512crypt')

Will set 'mysecret' as plain password, but return a newly created sha512crypt hash.

    $postgres_user4 = { username => 'user4' }
    $password_user4 = trocla_set('user4','mysecret','plain','pgsql',$postgres_user4)

Will set the plain password 'mysecret' and return a pgsql md5 hash for user5.

    $password_user2 = trocla_set('user2','*AAA...','mysql','sha512crypt')

This will likely fail, except if you add the plain password or the sha512crypt hash manually to
trocla, for example via cli.
"
) do |*args|
    if args[0].is_a?(Array)
      args = args[0]
    end
  
    key = args[0] 
    value = args[1]
    raise(Puppet::ParseError, "You need to pass at least key & value as an argument!") if key.nil? || value.nil?
  
    format = args[2] || 'plain'
    return_format = args[3] || format
    options = args[4] || {}
  
    configfile = File.join(File.dirname(Puppet.settings[:config]), "troclarc.yaml")
  
    raise(Puppet::ParseError, "Trocla config file #{configfile} not readable") unless File.exist?(configfile)
    raise(Puppet::ParseError, "You need rubygems to use Trocla") unless Puppet.features.rubygems?
  
    require 'rubygems'
    require 'trocla'
  
    result = (trocla=Trocla.new(configfile)).set_password(key,format,value)
    if format != return_format && (result = trocla.get_password(key,return_format)).nil?
      raise(Puppet::ParseError, "Plaintext password is not present, but required to return password in format #{return_format}") if (return_format == 'plain') || trocla.get_password(key,'plain').nil?
      result = trocla.password(key,return_format,options) 
    end
    result
  end
end
