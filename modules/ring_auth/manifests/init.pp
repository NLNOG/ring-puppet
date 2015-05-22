#
# Class: ring_auth
#
# Collect authentication credentials on auth.infra.ring.nlnog.net
# and redistribute them through inline_templates on master01
#
# Usage:
# include auth::landing (on auth.infra.ring.nlnog.net)
# include auth::deployer (on puppet master)

class ring_auth::landing {

    line { "master_ssh_key":
        line => 'command="/root/validate-rsync-backup" ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC2IAryByVSEFClwfNhkiEbsXvHKaxCL1+0EhNYHlqQyQHDeklCGF5Q/VzQq450fffnN/uXgGeR5ve2O0EJS4hERmMDs4FWClX9ZOMnlx8EWmzDDqNzZq4tgsWfbisiGImdncaOqQ6KOn6RlehyFfNiDmm9hPwmVV6AD/ERYGVPbPiIgLU3dlo/xtkCTClwd94fA+9UxMNEFMxs2rWbuNF7Ix0uHXZyXWkNEZD5T+D/1qOvsxztlI1MVVoprVxHzN+OpkYfK6BQMWruhAx6WjLoGiMVMYX0qreIoTlLq3XcsTXG0qtqKtEtHKLXHpIo3zS3S/gOrloj9Wex34vzgnOf root@master01.infra.ring.nlnog.net',
        file => "/root/.ssh/authorized_keys",
        ensure => present,
        require => File["/root/.ssh/"],
    }
    
    file { '/opt/keys':
        ensure => 'directory',
        mode   => '0755',
        owner  => 'root',
        group  => 'ring-admins',
    }

    cron { 'auth_sync_keys_to_opt_keys':
        user    => 'root',
        minute  => '*/15',
        command => '/usr/local/bin/auth-copy-keys-to-opt-keys',
        require => [Package['members'], File['/usr/local/bin/auth-copy-keys-to-opt-keys']],
    }

    file { '/usr/local/bin/auth-copy-keys-to-opt-keys':
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
        source  => 'puppet:///modules/ring_auth/auth-copy-keys-to-opt-keys',
        require => [Package['members'], File['/opt/keys']],
    }
 
}

class ring_auth::deployer {

    file { '/opt/keys':
        ensure => 'directory',
        mode   => '0555',
        owner  => 'root',
        group  => 'ring-admins',
    }
   
    # sync keys every 13 minutes from auth.infra.ring.nlnog.net to master
    cron { 'sync_user_sshkeys':
        command => 'rsync -4 -r --delete auth.infra.ring.nlnog.net:/opt/keys/ /opt/keys/ && chmod +r /opt/keys/* && chmod +rx /opt/keys',
        user    => 'root',
        minute  => '*/13',
    }
}
