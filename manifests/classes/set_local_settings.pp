class set_local_settings {                                                      

    # since i don't see any way to solve this without an exec in puppet we have
    # to do it the 'dirty' way
    # the problem is that you cannot overwrite/redefine a element at a later stage
    # Users that have the samen problem:
    # - http://groups.google.com/group/puppet-users/browse_thread/thread/46ba2f43858735ba
    # - http://www.mail-archive.com/puppet-users@googlegroups.com/msg15641.html
    # - http://www.mailinglistarchive.com/html/puppet-users@googlegroups.com/2011-03/msg00073.html
    # i've spend many hours trying to figure this out and will give up for at 
    # least the next 12 months
    # signing off - job (dec 2011)
#    exec { "add_owner_to_admingroup": 
#    command => "/usr/sbin/adduser ${owner} admin",
#    onlyif => [
#        "/usr/bin/test `/usr/bin/groups ${owner} | /bin/grep -w admin | /usr/bin/wc -l` -eq 0",
#        "test -d /home/${owner}/" ],
#    }

    user { 'ubuntu':
        ensure => absent,
    }
} 
