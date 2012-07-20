class bird-lg-proxy {
        
        file { "/home/nlnogbot/bird-lg":
            ensure  => directory,
            owner   => root,
            group   => root,
            mode    => 0755,
        }

        file { "/home/nlnogbot/bird-lg/lg-proxy.cfg":
            owner       => root,
            group       => root,
            mode        => 0755,
            content     => "bird-lg/lg-proxy.cfg.rb",
        }

        file { "/home/nlnogbot/bird-lg/lg-proxy.py":
            owner       => root,
            group       => root,
            mode        => 0755,
            source      => "puppet:///bird-lg/lg-proxy.py",
        }

        file { "/home/nlnogbot/bird-lg/bird.py":
            owner       => root,
            group       => root,
            mode        => 0755,
            source      => "puppet:///bird-lg/bird.py",
        }

        file { "/etc/init/bird-lg.conf":
            owner       => root,
            group       => root,
            mode        => 0755,
            source      => "puppet:///bird-lg/upstart-bird-lg.conf",
            require     => File["/home/nlnogbot/bird-lg/bird.py","/home/nlnogbot/bird-lg/lg-proxy.py","/home/nlnogbot/bird-lg/lg-proxy.cfg","/home/nlnogbot/bird-lg"],
        }

        service { "bird-lg":
            ensure      => running,
            require     => File["/etc/init/bird-lg.conf"],
            provider    => upstart,
        }
}
