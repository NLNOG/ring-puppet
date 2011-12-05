#
# == Class: postfix::tlspolicy
#
# Manages Postfix TLS policy by merging policy snippets shipped:
# - in the module's files/tls_policy.d/ or puppet:///files/etc/postfix/tls_policy.d
#   (the latter takes precedence if present); site-postfix module is supported
#   as well, see the source argument of file {"$postfix_tlspolicy_snippets_dir"
#   bellow for details.
# - via postfix::tlspolicy_snippet defines
#
# Parameters:
# - $postfix_tls_fingerprint_digest (defaults to sha1)
#
# Example usage:
# 
#   node "toto.example.com" {
#     $postfix_manage_tls_policy = yes
#     include postfix
#   }
#
class postfix::tlspolicy {

  # Default value for parameters
  case $postfix_tls_fingerprint_digest {
    "": { $postfix_tls_fingerprint_digest = 'sha1' }
  }

  include common::moduledir
  module_dir{'postfix/tls_policy': }

  $postfix_tlspolicy_dir          = "${common::moduledir::module_dir_path}/postfix/tls_policy"
  $postfix_tlspolicy_snippets_dir = "${postfix_tlspolicy_dir}/tls_policy.d"
  $postfix_merged_tlspolicy       = "${postfix_tlspolicy_dir}/merged_tls_policy"

  file {"$postfix_tlspolicy_snippets_dir":
    ensure  => 'directory',
    owner   => 'root',
    group   => '0',
    mode    => '700',
    source  => [
                "puppet:///modules/site-postfix/${fqdn}/tls_policy.d",
                "puppet:///modules/site-postfix/tls_policy.d",
                "puppet:///modules/postfix/tls_policy.d",
               ],
    recurse => true,
    purge   => false,
  }

  concatenated_file { "$postfix_merged_tlspolicy":
    dir     => "${postfix_tlspolicy_snippets_dir}",
    require => File["$postfix_tlspolicy_snippets_dir"],
  }

  postfix::hash { '/etc/postfix/tls_policy':
    source    => "$postfix_merged_tlspolicy",
    subscribe => File["$postfix_merged_tlspolicy"],
  }

  postfix::config {
    'smtp_tls_fingerprint_digest': value => "$postfix_tls_fingerprint_digest";
  }

  postfix::config { 'smtp_tls_policy_maps':
    value   => 'hash:/etc/postfix/tls_policy',
    require => [
                Postfix::Hash['/etc/postfix/tls_policy'],
                Postfix::Config['smtp_tls_fingerprint_digest'],
               ],
  }

}
