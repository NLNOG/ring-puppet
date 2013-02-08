Puppet::Parser::Functions::newfunction(
  :array_del,
  :type => :rvalue,
  :doc => "Deletes items from an array

    Example: array_del(['a','b'],'b') -> ['a']
             array_del(['a','b', 'c'],['b', 'c']) -> ['a']"
) do |args|
  raise Puppet::ParseError, 'array_del() needs two arguments' if args.length != 2
  res = args[0].dup.to_a
  args[1].each { |x| res.delete(x) }
  res
end
