# smokeping - everything a full mesh side wide installation
# Copyright (c) 2011 Job Snijders <job@snijders-it.nl>
# See LICENSE for the full license granted to you

# Define where the individual nodes' configs are stored
$SP_NODESDIR="/var/lib/puppet/modules/smokeping"
$SP_SLAVES_DIR="/var/lib/puppet/modules/smokeping/slaves"

import "master.pp"
import "slave.pp"

