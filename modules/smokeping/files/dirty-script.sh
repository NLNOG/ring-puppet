echo -n 'slaves = '  
for i in /var/lib/puppet/modules/smokeping/nodes/*
    do
        echo -n `/usr/bin/basename $i`' ' ;
    done
echo ''
