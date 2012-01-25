#!/usr/bin/perl -w

my $file = "./list4.txt";
my $dir = "./";

# store unix timestamp
my $tmp = `date +%s`;
# create scamper execution string.
my $scmprping = "scamper -c \"ping -c 3\" " . $file . "  > " . $dir . "scmpr-ping4-" . $tmp . ".log";
my $scmprtrace = "scamper " . $file . " > " . $dir . "scmpr-trace4-" . $tmp . ".log";

# remove enter from date string. 
$scmprping =~ s/\n//;
$scmprtrace =~ s/\n//;

# execute scamper string
`$scmprping &`;
# give ping 10 seconds head start.
`sleep 10`;
`$scmprtrace &`;
