class ansible::master {

  file { '/var/ring':
      ensure => 'directory',
      owner  => 'root',
      group  => 'ring-admins',
      mode   => '2775',
  }
    
  cron { ansible_deploy:
        command => "/usr/local/bin/ring-admin ansible deploy >/dev/null 2>/dev/null",
        minute  => "42",
        user    => ringforger,
        ensure  => present,
  }

}

class ansible::client {

    $minute = fqdn_rand(60)

    package {["ansible","git"]:
        ensure  => latest,
    }

    cron { ansible_pull:
        command => "ansible-pull -d /etc/ansible/ring -U https://github.com/NLNOG/ring-ansible.git -i nodes -l $fqdn -c local playbook.yml >/dev/null 2>/dev/null",
        minute  => "$minute",
        user    => root,
        ensure  => present,
    }

    #exec { 'ansible_pull':
    #    command => 'ansible-pull -o -d /etc/ansible/ring -U https://github.com/NLNOG/ring-ansible.git -i nodes -l $hostname -c local playbook.yml',
    #    path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
    #    timeout => 1800,
    #    require => Package["ansible"]
    #}

}
