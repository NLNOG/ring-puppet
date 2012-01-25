class uva_research {
        # UvA.nl related data gathering                                             
                                                                                
    file { "/home/job/scmpr/research-scmpr4.pl":                                  
        owner   => root,                                                        
        group   => root,                                                        
        mode    => 0755,                                                        
        source  => "puppet:///files/home/job/scmpr/research-scmpr4.pl",           
        ensure => present,                                                      
        require => File["/home/job/scmpr"], 
    }                                                                           
 
    file { "/home/job/scmpr/research-scmpr6.pl":                                  
        owner   => root,                                                        
        group   => root,                                                        
        mode    => 0755,                                                        
        source  => "puppet:///files/home/job/scmpr/research-scmpr6.pl",           
        ensure => present,                                                      
        require => File["/home/job/scmpr"], 
    }                                                                           
                                                                                
    file { "/home/job/scmpr":                                                   
        owner   => job,                                                         
        group   => job,                                                         
        ensure  => directory,                                                   
    }                                                                           
                                                                                
    file { "/home/job/scmpr/list4.txt":                                          
        owner   => job,                                                         
        group   => job,                                                         
        mode    => 0744,                                                        
        source  => "puppet:///files/home/job/scmpr/list4.txt",                   
        ensure  => present,                                                     
        require => File["/home/job/scmpr"],                                     
    }                                                                           
 
   file { "/home/job/scmpr/list6.txt":   
        owner   => job,                                                         
        group   => job,                                                         
        mode    => 0744,                                                        
        source  => "puppet:///files/home/job/scmpr/list6.txt",                   
        ensure  => present,                                                     
        require => File["/home/job/scmpr"],                                     
    }                                                                           
                                                                                
    file { "/home/job/scmpr/collect-data.sh":                                   
        owner   => job,                                                         
        group   => job,                                                         
        mode    => 0755,                                                        
        source  => "puppet:///files/home/job/scmpr/collect-data.sh",            
        ensure  => present,                                                     
        require => File["/home/job/scmpr"],                                     
    }
    
    cron {                                                                      
        "collect_scamper":                                                      
        command => "/home/job/scmpr/collect-data.sh > /dev/null 2>&1",          
        user => root,                                                           
        weekday => "*",                                                         
        hour => "*",                                                            
        minute => "*/5",                                                        
        require => File["/home/job/scmpr/collect-data.sh"],                     
    }
}
