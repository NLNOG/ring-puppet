#
# == Class: postfix
#
# This class provides a basic setup of postfix with local and remote
# delivery and an SMTP server listening on the loopback interface.
#
# Parameters:
# - *$postfix_smtp_listen*: address on which the smtp service will listen to. defaults to 127.0.0.1
# - *$root_mail_recipient*: who will recieve root's emails. defaults to "nobody"
#
# Example usage:
#
#   node "toto.example.com" {
#     $postfix_smtp_listen = "192.168.1.10"
#     include postfix
#   }
#
class postfix {

  # selinux labels differ from one distribution to another
  case $operatingsystem {

    RedHat, CentOS: {
      case $lsbmajdistrelease {
        "4":     { $postfix_seltype = "etc_t" }
        "5":     { $postfix_seltype = "postfix_etc_t" }
        default: { $postfix_seltype = undef }
      }
    }

    default: {
      $postfix_seltype = undef
    }
  }

  # Default value for various options
  case $postfix_smtp_listen {
    "": { $postfix_smtp_listen = "127.0.0.1" }
  }
  case $root_mail_recipient {
    "":   { $root_mail_recipient = "nobody" }
  }
  case $postfix_anon_sasl {
    "":    { $postfix_anon_sasl = "no" }
  }
  case $postfix_manage_header_checks {
    "":   { $postfix_manage_header_checks = "no" }
  }
  case $postfix_manage_tls_policy {
    "":   { $postfix_manage_tls_policy = "no" }
  }
  case $postfix_use_amavisd {
    "":   { $postfix_use_amavisd = "no" }
  }
  case $postfix_use_dovecot_lda {
    "":   { $postfix_use_dovecot_lda = "no" }
  }
  case $postfix_use_schleuder {
    "":   { $postfix_use_schleuder = "no" }
  }
  case $postfix_use_sympa {
    "":   { $postfix_use_sympa = "no" }
  }
  case $postfix_mastercf_tail {
    "":   { $postfix_mastercf_tail = "" }
  }
  case $postfix_inet_interfaces {
    "": { $postfix_inet_interfaces = 'all' }
  }
  case $postfix_myorigin {
    "": { $postfix_myorigin = $fqdn }
  }
  case $postfix_home_mailbox {
    "": { $postfix_home_mailbox = "" }
  }

  # Bootstrap moduledir
  include common::moduledir
  module_dir{'postfix': }

  # Include optional classes
  if $postfix_anon_sasl == 'yes' {
    include postfix::anonsasl
  }
  if $postfix_manage_header_checks == 'yes' {
    include postfix::header_checks
  }
  if $postfix_manage_tls_policy == 'yes' {
    include postfix::tlspolicy
  }
  if $postfix_use_amavisd == 'yes' {
    include postfix::amavis
  }

  package { ["postfix", "bsd-mailx", "postfix-pcre"]:
    ensure => installed
  }

  if $operatingsystem == 'debian' {
    Package[mailx] { name => 'bsd-mailx' }
  }

  service { "postfix":
    ensure  => running,
    require => Package["postfix"],
  }

  file { "/etc/mailname":
    ensure  => present,
    content => "${fqdn}\n",
    seltype => $postfix_seltype,
  }

  # Aliases
  file { "/etc/aliases":
    ensure => present,
    content => "# file managed by puppet\n",
    replace => false,
    seltype => $postfix_seltype,
    notify => Exec["newaliases"],
  }

  # Aliases
  exec { "newaliases":
    command     => "/usr/bin/newaliases",
    refreshonly => true,
    require     => Package["postfix"],
    subscribe   => File["/etc/aliases"],
  }

  # Config files
  file { "/etc/postfix/master.cf":
    ensure  => present,
    owner => "root",
    group => "root",
    mode => "0644",
    content => $operatingsystem ? {
      Redhat => template("postfix/master.cf.redhat5.erb"),
      CentOS => template("postfix/master.cf.redhat5.erb"),
      Debian => template("postfix/master.cf.debian-$lsbdistcodename.erb"),
      Ubuntu => template("postfix/master.cf.debian-etch.erb"),
    },
    seltype => $postfix_seltype,
    notify  => Service["postfix"],
    require => Package["postfix"],
  }

  # Config files
  file { "/etc/postfix/main.cf":
    ensure  => present,
    owner => "root",
    group => "root",
    mode => "0644",
    source  => "puppet:///modules/postfix/main.cf",
    replace => true,
    seltype => $postfix_seltype,
    notify  => Service["postfix"],
    require => Package["postfix"],
  }
  file { "/etc/postfix/smtp_reply_filter":
    ensure  => present,
    owner => "root",
    group => "root",
    mode => "0644",
    source  => "puppet:///modules/postfix/smtp_reply_filter",
    replace => true,
    notify  => Service["postfix"],
    require => Package["postfix"],
  }

  # Default configuration parameters
  postfix::config {
    "myorigin":   value => "${postfix_myorigin}";
    "alias_maps": value => "hash:/etc/aliases";
    "inet_interfaces": value => "${postfix_inet_interfaces}";
    "smtp_reply_filter": value => "pcre:/etc/postfix/smtp_reply_filter";
    "home_mailbox": value => "${postfix_home_mailbox}";
  }

  case $operatingsystem {
    RedHat, CentOS: {
      postfix::config {
        "sendmail_path": value => "/usr/sbin/sendmail.postfix";
        "newaliases_path": value => "/usr/bin/newaliases.postfix";
        "mailq_path": value => "/usr/bin/mailq.postfix";
      }
    }
  }

  postfix::mailalias {"root":
    recipient => $root_mail_recipient,
  }
}
