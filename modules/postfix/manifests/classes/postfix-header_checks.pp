#
# == Class: postfix::header_checks
#
# Manages Postfix header_checks by merging snippets shipped:
# - in the module's files/header_checks.d/ or puppet:///files/etc/postfix/header_checks.d
#   (the latter takes precedence if present); site-postfix module is supported
#   as well, see the source argument of file {"$postfix_header_checks_snippets_dir"
#   bellow for details.
# - via postfix::header_checks_snippet defines
#
# Example usage:
# 
#   node "toto.example.com" {
#     $postfix_manage_header_checks = yes
#     include postfix
#   }
#
class postfix::header_checks {

  include common::moduledir
  module_dir{'postfix/header_checks': }

  $postfix_header_checks_dir          = "${common::moduledir::module_dir_path}/postfix/header_checks"
  $postfix_header_checks_snippets_dir = "${postfix_header_checks_dir}/header_checks.d"
  $postfix_merged_header_checks       = "${postfix_header_checks_dir}/merged_header_checks"

  file {"$postfix_header_checks_snippets_dir":
    ensure  => 'directory',
    owner   => 'root',
    group   => '0',
    mode    => '700',
    source  => [
                "puppet:///modules/site-postfix/${fqdn}/header_checks.d",
                "puppet:///modules/site-postfix/header_checks.d",
                "puppet:///files/etc/postfix/header_checks.d",
                "puppet:///modules/postfix/header_checks.d",
               ],
    recurse => true,
    purge   => false,
  }

  concatenated_file { "$postfix_merged_header_checks":
    dir     => "${postfix_header_checks_snippets_dir}",
    require => File["$postfix_header_checks_snippets_dir"],
  }
  
  config_file { '/etc/postfix/header_checks':
    source    => "$postfix_merged_header_checks",
    subscribe => File["$postfix_merged_header_checks"],
  }

  postfix::config { "header_checks":
    value   => 'regexp:/etc/postfix/header_checks',
    require => File['/etc/postfix/header_checks'],
  }

}
