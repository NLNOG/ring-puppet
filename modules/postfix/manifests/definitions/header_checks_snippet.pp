/*
== Definition: postfix::header_checks_snippet

Adds a header_checks snippets to /etc/postfix/header_checks.
See the postfix::header_checks class for details.

Parameters:
- *source* or *content*: source or content of the header_checks snippet
- *ensure*: present (default) or absent

Requires:
- Class["postfix"]

Example usage:

  node "toto.example.com" {
    include postfix
    postfix::header_checks {
      'wrong_date': content => 'FIXME';
      'bla':        source => 'puppet:///files/etc/postfix/header_checks.d/bla';
    }
  }

*/

define postfix::header_checks_snippet (
  $ensure  = "present",
  $source = '',
  $content = undef
) {

  if $source == '' and $content == undef {
    fail("One of \$source or \$content must be specified for postfix::header_checks_snippet ${name}")
  }

  if $source != '' and $content != undef {
    fail("Only one of \$source or \$content must specified for postfix::header_checks_snippet ${name}")
  }

  if ($value == false) and ($ensure == "present") {
    fail("The value parameter must be set when using the postfix::header_checks_snippet define with ensure=present.")
  }

  include postfix::header_checks

  $snippetfile = "${postfix::header_checks::postfix_header_checks_snippets_dir}/${name}"
  
  file { "$snippetfile":
    ensure  => "$ensure",
    mode    => 600,
    owner   => root,
    group   => 0,
    notify => Exec["concat_${postfix::header_checks::postfix_merged_header_checks}"],
  }

  if $source {
    File["$snippetfile"] {
      source => $source,
    }
  }
  else {
    File["$snippetfile"] {
      content => $content,
    }
  }

}
