class trocla::config($ruby='system') {
  if $trocla::config::ruby == 'system' or $trocla::config::ruby == 'both' {
    require trocla::master
  }
  if $trocla::config::ruby == 'ree' or $trocla::config::ruby == 'both' {
    require trocla::master::ree
  }

  # deploy default config file and link it for trocla cli lookup
  file{
    "${settings::confdir}/troclarc.yaml":
      content => "---\nadapter_options:\n    :path: ${settings::confdir}/trocla_data.yaml\n",
      owner => root, group => puppet, mode => 0640;
    '/etc/troclarc.yaml':
      ensure => link,
      target => "${settings::confdir}/troclarc.yaml";
    "${settings::confdir}/trocla_data.yaml":
      ensure => present,
      owner => puppet, group => 0, mode => 0600;
  }
}
