#!/usr/bin/perl -w

my $file = "./list6.txt";
my $dir = "./";

# store unix timestamp
my $tmp = `date +%s`;
# create scamper execution string.
my $scmprping = "scamper -c \"ping -c 3\" " . $file . "  > " . $dir . "scmpr-ping6-" . $tmp . ".log";
my $scmprtrace = "scamper " . $file . " > " . $dir . "scmpr-trace6-" . $tmp . ".log";

# remove enter from date string. 
$scmprping =~ s/\n//;
$scmprtrace =~ s/\n//;

# execute scamper string
`$scmprping &`;
# give ping 10 seconds head start.
`sleep 10`;
`$scmprtrace &`;
