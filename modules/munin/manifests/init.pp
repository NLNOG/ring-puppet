# munin.pp - everything a sitewide munin installation needs
# Copyright (C) 2007 David Schmitt <david@schmitt.edv-bus.at>
# See LICENSE for the full license granted to you.

# the port is a parameter so vservers can share IP addresses and still be happy

# Define where the individual nodes' configs are stored
$NODESDIR="/var/lib/puppet/modules/munin/nodes"

import "host.pp"
import "client.pp"
import "plugin.pp"

#include assert_lsbdistcodename

