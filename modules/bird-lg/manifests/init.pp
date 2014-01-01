class bird-lg-proxy {
        
        file { "/usr/local/bird-lg":
            ensure  => directory,
            owner   => root,
            group   => root,
            mode    => 0755,
        }

        file { "/usr/local/bird-lg/lg-proxy.cfg":
            owner       => root,
            group       => root,
            mode        => 0755,
            content     => template("bird-lg/lg-proxy.cfg.rb"),
        }

        file { "/usr/local/bird-lg/lg-proxy.py":
            owner       => root,
            group       => root,
            mode        => 0755,
            source      => "puppet:///bird-lg/lg-proxy.py",
        }

        file { "/usr/local/bird-lg/bird.py":
            owner       => root,
            group       => root,
            mode        => 0755,
            source      => "puppet:///bird-lg/bird.py",
        }

        file { "/etc/init/bird-lg-proxy.conf":
            owner       => root,
            group       => root,
            mode        => 0755,
            source      => "puppet:///bird-lg/upstart-bird-lg-proxy.conf",
            require     => File["/usr/local/bird-lg/bird.py","/usr/local/bird-lg/lg-proxy.py","/usr/local/bird-lg/lg-proxy.cfg","/usr/local/bird-lg"],
        }

        service { "bird-lg-proxy":
            ensure      => running,
            require     => File["/etc/init/bird-lg-proxy.conf"],
            provider    => upstart,
        }
}
