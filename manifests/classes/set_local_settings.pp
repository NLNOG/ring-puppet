class set_local_settings {                                                      
    exec { "add_owner_to_admingroup":                                           
    command => "adduser ${owner} admin",                                        
    onlyif => [                                                                 
        "/usr/bin/test `/usr/bin/groups ${owner} | /bin/grep -w admin | /usr/bin/wc -l` -eq 0",
        "test -d /home/${owner}/" ],                                            
    }                                                                           
} 
