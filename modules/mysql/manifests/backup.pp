/*
== Class: mysql::backup

Enable mysql daily backup script.

The script /usr/local/bin/mysql-backup.sh will be run every night. It runs
mysqldump --all-databases. Backups will be stored in /var/backups/mysql.

Attributes:
- $mysqldump_retention: defines if backup rotate on a weekly, monthly or yearly
  basis. Accepted values: 'week', 'month', 'year'. Defaults to 'week'.
- $mysql_backupdir: defines backup location
  Default value: '/var/backups/mysql'
- $mysqldump_options: defines options passed to mysqldump command.
  Please refer to the manpage.
  Default value: '--all-database --extended-insert'
- $mysql_post_backup_hook: defines commands to be called after the backup is made, gzipped and moved to $backup_dir/mysql-$date.sql.gz, where $day is the day of the week.

*/
class mysql::backup {

  include mysql::common
  include mysql::params

  if !$mysqldump_retention {
    $mysqldump_retention = 'week'
  }
  if !$mysqldump_options {
    $mysqldump_options = '--all-database --extended-insert'
  }

  if !$mysql_post_backup_hook {
    $mysql_post_backup_hook = ''
  }

  $data_dir = $mysql::params::data_dir
  $backup_dir = $mysql::params::backup_dir

  file {$backup_dir:
    ensure  => directory,
    owner   => 'root',
    group   => 'mysql-admin',
    mode    => '0750',
    require => Group['mysql-admin']
  }

  file {'/usr/local/bin/mysql-backup.sh':
    ensure  => present,
    content => template('mysql/mysql-backup.sh.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0555',
  }

  cron {'mysql-backup':
    command => "/usr/local/bin/mysql-backup.sh ${mysqldump_retention}",
    user    => 'root',
    hour    => 2,
    minute  => 0,
    require => [File[$backup_dir], File['/usr/local/bin/mysql-backup.sh']],
  }

}
