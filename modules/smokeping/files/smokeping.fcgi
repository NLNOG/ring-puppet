#!/bin/sh
# maybe add some extra perl search path
# export PERL5LIB=/opt/rrdtool/lib/perl
exec /usr/lib/cgi-bin/smokeping.cgi /etc/smokeping/config
