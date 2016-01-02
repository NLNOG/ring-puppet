# Class: ring_users
#
# This class creates all normal users on all ring nodes 
# This is the file that manages all users 
# if you want to remove a user add 'ensure => absent' to the @add_user block
# if you want to remove or add a key, just add it to the appropiate array under the correct user
#
# Parameters:
#   none
# Actions:
#   Configures or removes all normal users on a ringnode
# Requires:
#   - add_user from classes/user.pp
#

class users::virtual::ring_users {

##### BEGIN scamper #####

    @add_user { 'scamper':
        email   => 'ring-admins@ring.nlnog.net',
        company => 'Scamper Collector',
        uid     => 2001,
        groups  => ['ring-users'],
    }

##### END scamper #####

}
