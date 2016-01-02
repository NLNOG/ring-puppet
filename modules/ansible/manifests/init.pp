class ansible::master {

  file { '/var/ring':
      ensure => 'directory',
      owner  => 'root',
      group  => 'ring-admins',
      mode   => '2775',
  }

}

class ansible::client {

    $minute = fqdn_rand(60)

    package {["ansible","git"]:
        ensure  => latest,
    }

    cron { ansible_pull:
        command => "ansible-pull -d /etc/ansible/ring -U https://github.com/NLNOG/ring-ansible.git -i nodes playbook.yml >/dev/null 2>/dev/null",
        minute  => "$minute",
        user    => root,
        ensure  => present,
    }

    exec { 'ansible_pull':
        command => 'ansible-pull -o -d /etc/ansible/ring -U https://github.com/NLNOG/ring-ansible.git -i nodes playbook.yml',
        path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
        require => Package["ansible"]
    }

}
