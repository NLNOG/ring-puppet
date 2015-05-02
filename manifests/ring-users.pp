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

##### BEGIN former users #####

@add_user { 'ic-hosting':
    email   => 'info@ic-hosting.nl',
    company => 'IC Hosting',
    uid => 5014,
    groups  => ['ring-users'],
    ensure => absent,
}

@add_user { 'rbnetwork':
    email   => 'noc@rbnetwork.ch',
    company => 'RB Network',
    uid => 5098,
    groups  => ['ring-users'],
    ensure => absent,
}

@add_user { 'bci':
    email   => 'support@ipv6.ps',
    company => 'BNET - BCI Telecommunication & Advanced Technology Company',
    uid => 5121,
    groups  => ['ring-users'],
    ensure => absent,
}

@add_user { 'digiweb':
    email   => 'noc@digiweb.ie',
    company => 'Digiweb Ltd',
    uid => 5115,
    groups  => ['ring-users'],
    ensure => absent,
}

@add_user { 'neotelecoms':
    email   => 'eng@neotelecoms.com',
    company => 'Neotelecoms',
    uid => 5056,
    groups  => ['ring-users'],
    ensure => absent,
}

@add_user { 'nuqe':
    email   => 'nat@nuqe.net',
    company => 'AS30746',
    uid => 5139,
    groups  => ['ring-users'],
    ensure => absent,
}

@add_user { 'rediris':
    email   => 'cert@rediris.es',
    company => 'RedIRIS',
    uid => 5154,
    groups  => ['ring-users'],
    ensure => absent,
}

@add_user { 'yacast':
    email   => 'noc@yacast.fr',
    company => 'Yacast Media',
    uid => 5066,
    groups  => ['ring-users'],
    ensure => absent,
}

@add_user { 'networkdesign':
    email   => 'noc@ndnet.ch',
    company => 'Network Design GmbH',
    uid => 5073,
    groups  => ['ring-users'],
    ensure => absent,
}

@add_user { 'networking4all':
    email => 'noc@networking4all.com',
    company => 'Networking4all',
    uid => 5153,
    groups => ['ring-users'],
    ensure => absent,
}

@add_user { 'msp':
    email => 'noc@mediasp.com',
    company => 'Media Service Provider',
    uid => 5043,
    groups => ['ring-users'],
    ensure  => absent,
}

@add_user { 'indit':
    email => 'noc@indithosting.se',
    company => 'Indit Hosting AB',
    uid => 5149,
    groups => ['ring-users'],
    ensure  => absent,
}

@add_user { 'timico':
    email => 'networks@timico.net',
    company => 'Timico Ltd.',
    uid => 5065,
    groups => ['ring-users'],
    ensure  => absent,
}

##### BEGIN xlshosting #####

@add_user { 'xlshosting':
    email    => 'noc@xlshosting.nl',
    company => 'XLSHosting BV',
    uid      => 5005,
    groups   => ['ring-users'],
    ensure  => absent,
}

##### END xlshosting #####

##### END former users #####

##### BEGIN intouch #####

    @add_user { 'intouch':
        email    => 'tech@intouch.eu',
        company => 'InTouch NV',
        uid      => 5001,
        groups  => ['ring-users'],
    }

##### END intouch #####

##### BEGIN bit #####

    @add_user { 'bit':
        email    => 'support@bit.nl',
        company => 'BIT',
        uid      => 5002,
        groups   => ['ring-users']
    }

##### END bit #####

##### BEGIN coloclue #####

    @add_user { 'coloclue':
        email   => 'routers@coloclue.net',
        company => 'Netwerkvereniging Coloclue',
        uid     => 5003,
        groups  => ['ring-users']
    }

##### END coloclue #####

##### BEGIN widexs #####

    @add_user { 'widexs':
        email    => 'noc@widexs.nl',
        company => 'WideXS',
        uid      => 5004,
        groups   => ['ring-users']
    }

##### END widexs #####


##### BEGIN interconnect #####

    @add_user { 'interconnect':
        email    => 'noc@interconnect.nl',
        company => 'Interconnect',
        uid      => 5006,
        groups   => ['ring-users']
    }

##### END interconnect #####

##### BEGIN cambrium #####

    @add_user { 'cambrium':
        email    => 'noc@cambrium.nl',
        company => 'Cambrium',
        uid      => 5007,
        groups   => ['ring-users']
    }

##### END cambrium #####

##### BEGIN zylon #####

    @add_user { 'zylon':
        email    => 'smite@zylon.net',
        company => 'Zylon',
        uid      => 5008,
        groups   => ['ring-users']
    }

##### END zylon #####

##### BEGIN duocast #####

    @add_user { 'duocast':
        email   => 'noc@duocast.net',
        company => 'Duocast',
        uid     => 5009,
        groups  => ['ring-users']
    }

##### END duocast #####

##### BEGIN easyhosting #####

    @add_user { 'easyhosting':
        email   => 'systeembeheer@easyhosting.nl',
        company => 'Easyhosting',
        uid     => 5010,
        groups  => ['ring-users']
    }

##### END easyhosting #####

##### BEGIN previder #####

    @add_user { 'previder':
        email   => 'noc@previder.net',
        company => 'Previder',
        uid     => 5011,
        groups  => ['ring-users']
    }

##### END previder #####
 
##### BEGIN leaseweb #####

    @add_user { 'leaseweb':
        email   => 'noc@leaseweb.com',
        company => 'Leaseweb BV',
        uid     => 5012,
        groups  => ['ring-users']
    }

##### END leaseweb #####
 
##### BEGIN nxs #####

    @add_user { 'nxs':
        email   => 'ralph.smit@nxs.nl',
        company => 'NXS',
        uid     => 5013,
        groups  => ['ring-users']
    }

##### END nxs #####
 
##### BEGIN xs4all #####
 
    @add_user { 'xs4all':
        email   => 'noc@xs4all.net',
        company => 'XS4ALL',
        uid     => 5015,
        groups  => ['ring-users']
    }

##### END xs4all #####

##### BEGIN nedzone #####

    @add_user { 'nedzone':
        email   => 'noc@nedzone.nl',
        company => 'Nedzone BV',
        uid     => 5016,
        groups  => ['ring-users'],
    }

##### END nedzone #####

##### BEGIN nlnogbot #####

    @add_user { 'nlnogbot':
        email   => 'sten@snore.nl',
        company => 'Sten Spans limited',
        uid     => 5017,
        groups  => ['ring-users'],
    }

##### END nlnogbot #####

##### BEGIN oxilion #####

    @add_user { 'oxilion':
        email   => 'noc@oxilion.nl',
        company => 'Oxilion',
        uid     => 5018,
        groups  => ['ring-users'],
    }

##### END oxilion #####

##### BEGIN ebayclassifiedsgroup #####

    @add_user { 'ebayclassifiedsgroup':
        email   => 'DL-eBay-Classifieds-Networking@ebay.com',
        company => 'eBay Classifieds Group',
        uid     => 5019,
        groups  => ['ring-users'],
    }

##### END ebayclassifiedsgroup #####

##### BEGIN is #####

    @add_user { 'is':
        email   => 'netwerk@is.nl',
        company => 'IS',
        uid     => 5021,
        groups  => ['ring-users'],
    }

##### END is #####

##### BEGIN surfnet #####

    @add_user { 'surfnet':
        email   => 'surf-ring@prolocation.eu',
        company => 'SURFNet',
        uid     => 5022,
        groups  => ['ring-users'],
    }

##### END surfnet #####

##### BEGIN prolocation #####

    @add_user { 'prolocation':
        email   => 'cedric@prolocation.net',
        company => 'Prolocation',
        uid     => 5023,
        groups  => ['ring-users'],
    }

##### END prolocation #####

##### BEGIN in2ip #####

    @add_user { 'in2ip':
        email => 'noc@in2ip.nl',
        company => 'IN2IP',
        uid => 5024,
        groups => ['ring-users'],
    }

##### END in2ip #####

##### BEGIN netground #####

    @add_user { 'netground':
        email   => 'systeembeheer@netground.nl',
        company => 'NetGround BV',
        uid     => 5025,
        groups  => ['ring-users'],
    }

##### END netground #####

##### BEGIN totaalnet #####

    @add_user { 'totaalnet':
        email   => 'noc@gl-ix.net',
        company => 'Totaalnet',
        uid     => 5026,
        groups  => ['ring-users'],
    }

##### END totaalnet #####

##### BEGIN signet #####

    @add_user { 'signet':
       email    => 'noc@signet.nl',
       company => 'SIGNet',
       uid      => 5027,
       groups   => ['ring-users'],
    }

##### END signet #####

##### BEGIN tripleit #####

    @add_user { 'tripleit':
       email    => 'support@triple-it.nl',
       company => 'Triple IT BV',
       uid      => 5028,
       groups   => ['ring-users'],
    }

##### END tripleit #####

##### BEGIN jaguarnetwork #####

    @add_user { 'jaguarnetwork':
       email    => 'noc@as30781.net',
       company => 'Jaguar Networks',
       uid      => 5029,
       groups   => ['ring-users'],
    }

##### END jaguarnetwork #####

##### BEGIN tuxis #####

    @add_user { 'tuxis':
       email    => 'mark@tuxis.nl',
       company => 'Tuxis Internet Engineering',
       uid      => 5030,
       groups   => ['ring-users'],
    }

##### END tuxis #####

##### BEGIN tenet #####

    @add_user { 'tenet':
       email    => 'noc@tenet.ac.za',
       company => 'TENET',
       uid      => 5031,
       groups   => ['ring-users'],
    }

##### END tenet #####

#### BEGIN bigwells #####

    @add_user { 'bigwells':
        email   => 'neteng@bigwells.net',
        company => 'Bigwells',
        uid     => 5032,
        groups  => ['ring-users'],
    }

#### END bigwells #####

#### BEGIN hibernia #####

    @add_user { 'hibernia':
        email   => 'nmc@atrato.com',
        company => 'Hibernia Networks',
        uid     => 5033,
        groups  => ['ring-users'],
    }

#### END hibernia #####

#### BEGIN cyso #####

    @add_user { 'cyso':
        email   => 'noc@cyso.net',
        company => 'Cyso',
        uid     => 5034,
        groups  => ['ring-users'],
    }

#### END cyso #####

#### BEGIN netability #####

    @add_user { 'netability':
        email   => 'nick@netability.ie',
        company => 'Netability',
        uid     => 5036,
        groups  => ['ring-users'],
    }

#### END netablity #####


#### BEGIN unilogicnetworks #####

    @add_user { 'unilogicnetworks':
        email   => 'noc@unilogicnetworks.net',
        company => 'Unilogic Networks',
        uid     => 5037,
        groups  => ['ring-users'],
    }

##### END unilogicnetworks #####

#### BEGIN maverick #####

    @add_user { 'maverick':
        email   => 'noc@maverick.com.pl',
        company => 'Maverick',
        uid     => 5038,
        groups  => ['ring-users'],
    }

##### END maverick #####

#### BEGIN acsystemy #####

    @add_user { 'acsystemy':
        email => 'noc@acsystemy.pl',
        company => 'AC Systemy',
        uid => 5039,
        groups => ['ring-users'],
    }

#### END acsystemy #####

#### BEGIN netsign #####

    @add_user { 'netsign':
        email => 'noc@netsign.eu',
        company => 'Netsign',
        uid => 5040,
        groups => ['ring-users'],
    }

##### END netsign #####

#### BEGIN rrbone #####

    @add_user { 'rrbone':
        email => 'noc@rrbone.net',
        company => 'rrbone',
        uid => 5041,
        groups => ['ring-users'],
    }

##### END rrbone #####

##### BEGIN hosteam #####

    @add_user { 'hosteam':
        email => 'noc@hosteam.pl',
        company => 'HosTeam',
        uid => 5042,
        groups => ['ring-users'],
    }

##### END hosteam #####

##### BEGIN inotel #####

    @add_user { 'inotel':
        email => 'noc@inotel-voip.pl',
        company => 'Inotel',
        uid => 5044,
        groups => ['ring-users'],
    }

##### END inotel #####

##### BEGIN fremaks #####

    @add_user { 'fremaks':
        email => 'noc@fremaks.de',
        company => 'Fremaks GmbH',
        uid => 5045,
        groups => ['ring-users'],
    }

##### END fremaks #####

##### BEGIN blix #####

    @add_user { 'blix':
        email => 'support@blixsolutions.no',
        company => 'Blix Solutions',
        uid => 5046,
        groups => ['ring-users'],
    }

##### END blix #####

##### BEGIN portlane #####

    @add_user { 'portlane':
        email => 'noc@portlane.com',
        company => 'Portlane',
        uid => 5047,
        groups => ['ring-users'],
    }

##### END portlane #####

##### BEGIN solido #####

    @add_user { 'solido':
        email => 'noc@solido.net',
        company => 'Solido',
        uid => 5048,
        groups => ['ring-users'],
    }

##### END solido #####

##### BEGIN digmia #####

    @add_user { 'digmia':
        email => 'ring@digmia.com',
        company => 'Digmia',
        uid => 5049,
        groups => ['ring-users'],
    }

##### END digmia #####

##### BEGIN rootlu #####

    @add_user { 'rootlu':
        email => 'noc@as5577.net',
        company => 'ROOT S.A.',
        uid => 5050,
        groups => ['ring-users'],
    }

##### END rootlu #####

##### BEGIN globalaxs #####

    @add_user { 'globalaxs':
        email => 'nmc@m247.com',
        company => 'GlobalAXS Communications Ltd',
        uid => 5051,
        groups => ['ring-users'],
    }

##### END globalaxs #####

##### BEGIN nebula #####

    @add_user { 'nebula':
        email => 'net-core@nebula.fi',
        company => 'Nebula Oy',
        uid => 5052,
        groups => ['ring-users'],
    }

##### END nebula #####

##### BEGIN tilaa #####

    @add_user { 'tilaa':
        email => 'noc@tilaa.net',
        company => 'Tilaa B.V.',
        uid => 5053,
        groups => ['ring-users'],
    }

##### END tilaa #####

##### BEGIN nautile #####

    @add_user { 'nautile':
        email => 'network@nautile.nc',
        company => 'Nautile',
        uid => 5054,
        groups => ['ring-users'],
    }

##### END nautile #####

##### BEGIN voxel #####

    @add_user { 'voxel':
        email => 'asr@voxel.net',
        company => 'Voxel dot Net, Inc.',
        uid => 5055,
        groups => ['ring-users'],
    }

##### END voxel #####

##### BEGIN apnic #####

    @add_user { 'apnic':
        email => 'noc-notify@apnic.net',
        company => 'APNIC',
        uid => 5057,
        groups => ['ring-users'],
    }

##### END apnic #####

##### BEGIN man-da #####

    @add_user { 'man-da':
        email => 'noc@man-da.de',
        company => 'man-da.de GmbH',
        uid => 5058,
        groups => ['ring-users'],
    }

##### END man-da #####

##### BEGIN webair #####

    @add_user { 'webair':
        email => 'ipadmin@webair.com',
        company => 'Webair Internet Development Inc',
        uid => 5059,
        groups => ['ring-users'],
    }

##### END webair #####

##### BEGIN concepts-ict #####

    @add_user { 'concepts-ict':
        email => 'noc@concepts.nl',
        company => 'Concepts ICT',
        uid => 5060,
        groups => ['ring-users'],
    }

##### END concepts-ict #####

##### BEGIN dataoppdrag #####

    @add_user { 'dataoppdrag':
        email => 'noc@dataoppdrag.no',
        company => 'DataOppdrag AS',
        uid => 5061,
        groups => ['ring-users'],
    }

##### END dataoppdrag #####

##### BEGIN tetaneutral #####

    @add_user { 'tetaneutral':
        email => 'noc@tetaneutral.net',
        company => 'Association tetaneutral.net',
        uid => 5062,
        groups => ['ring-users'],
    }

##### END tetaneutral #####

##### BEGIN jumpnetworks #####

    @add_user { 'jump':
        email => 'admins@jump.net.uk',
        company => 'Jump Networks Ltd',
        uid => 5063,
        groups => ['ring-users'],
    }

##### END jumpnetworks #####

##### BEGIN iway  #####

    @add_user { 'iway':
        email => 'noc@as8758.net',
        company => 'iway AG',
        uid => 5064,
        groups => ['ring-users'],
    }

##### END iway #####

##### BEGIN rezopole  #####

    @add_user { 'rezopole':
        email => 'noc@rezopole.net',
        company => 'Rezopole',
        uid => 5067,
        groups => ['ring-users'],
    }

##### END rezopole #####

##### BEGIN solnet  #####

    @add_user { 'solnet':
        email => 'noc@solnet.ch',
        company => 'Solnet',
        uid => 5068,
        groups => ['ring-users'],
    }

##### END solnet #####

##### BEGIN boxed-it #####

    @add_user { 'boxed-it':
        email => 'netadmin@boxed-it.com',
        company => 'Boxed IT Ltd.',
        uid => 5069,
        groups => ['ring-users'],
    }

##### END boxed-it #####

##### BEGIN spacenet #####

    @add_user { 'spacenet':
        email => 'netmaster-dist@space.net',
        company => 'SpaceNet AG',
        uid => 5070,
        groups => ['ring-users'],
    }

##### END spacenet #####

##### BEGIN mironet #####

    @add_user { 'mironet':
        email => 'noc@mironet.ch',
        company => 'MiroNet GmbH',
        uid => 5071,
        groups => ['ring-users'],
    }

##### END mironet #####

##### BEGIN seeweb #####

    @add_user { 'seeweb':
        email => 'noc@seeweb.it',
        company => 'Seeweb s.r.l.',
        uid => 5072,
        groups => ['ring-users'],
    }

##### END seeweb #####

##### BEGIN zensystems #####

    @add_user { 'zensystems':
        email => 'noc@zensystems.dk',
        company => 'Zen Systems',
        uid => 5074,
        groups => ['ring-users'],
    }

##### END zensystems #####

##### BEGIN westnet #####

    @add_user { 'westnet':
        email => 'noc@westnet.ie',
        company => 'Westnet',
        uid => 5075,
        groups => ['ring-users'],
    }

##### END westnet #####

##### BEGIN kantonsschulezug #####

    @add_user { 'kantonsschulezug':
        email => 'noc@as34288.net',
        company => 'Kantonsschule Zug',
        uid => 5076,
        groups => ['ring-users'],
    }

##### END kantonsschulezug #####

##### BEGIN filoo #####

    @add_user { 'filoo':
        email => 'noc@filoo.de',
        company => 'Filoo GmbH',
        uid => 5077,
        groups => ['ring-users'],
    }

##### END filoo #####

##### BEGIN nessus #####

    @add_user { 'nessus':
        email => 'td@nessus.at',
        company => 'Nessus GmbH',
        uid => 5078,
        groups => ['ring-users'],
    }

##### END nessus #####

##### BEGIN amazon #####

    @add_user { 'amazon':
        email => 'colinwh@amazon.com',
        company => 'Amazon Web Services',
        uid => 5079,
        groups => ['ring-users'],
    }

##### END amazon #####

##### BEGIN equinixnl #####

    @add_user { 'equinixnl':
        email => 'servicedesk.nl@eu.equinix.com',
        company => 'Equinix NL',
        uid => 5080,
        groups => ['ring-users'],
    }

##### END equinixnl #####

##### BEGIN lchost #####

    @add_user { 'lchost':
        email => 'phil@lchost.co.uk',
        company => 'LCHost',
        uid => 5081,
        groups => ['ring-users'],
    }

##### END lchost #####

##### BEGIN hostway #####

    @add_user { 'hostway':
        email => 'noc@netnation.com',
        company => 'Hostway',
        uid => 5082,
        groups => ['ring-users'],
    }

##### END hostway #####

##### BEGIN pcextreme #####

    @add_user { 'pcextreme':
        email => 'network@pcextreme.nl',
        company => 'PCextreme',
        uid => 5083,
        groups => ['ring-users'],
    }

##### END pcextreme #####

##### BEGIN antagonist #####

    @add_user { 'antagonist':
        email => 'systeembeheer@antagonist.nl',
        company => 'Antagonist',
        uid => 5084,
        groups => ['ring-users'],
    }

##### END antagonist #####

##### BEGIN nts #####

    @add_user { 'nts':
        email => 'noc@nts.ch',
        company => 'NTS Workspace AG',
        uid => 5085,
        groups => ['ring-users'],
    }

##### END nts #####

##### BEGIN multiplay #####

    @add_user { 'multiplay':
        email => 'noc@multiplay.co.uk',
        company => 'Multiplay',
        uid => 5086,
        groups => ['ring-users'],
    }

##### END multiplay #####

##### BEGIN softlayer #####

    @add_user { 'softlayer':
        email => 'noc@softlayer.com',
        company => 'Softlayer Technologies',
        uid => 5087,
        groups => ['ring-users'],
    }

##### END softlayer #####

##### BEGIN imagine #####

    @add_user { 'imagine':
        email => 'networkoperations@imaginegroup.ie',
        company => 'Imagine Communications Ltd.',
        uid => 5088,
        groups => ['ring-users'],
    }

##### END imagine #####

##### BEGIN speedpartner #####

    @add_user { 'speedpartner':
        email => 'info@speedpartner.de',
        company => 'SpeedPartner GmbH',
        uid => 5089,
        groups => ['ring-users'],
    }

##### END speedpartner #####

##### BEGIN gossamerthreads #####

    @add_user { 'gossamerthreads':
        email => 'noc-nlnog@gt.net',
        company => 'Gossamer Threads Inc.',
        uid => 5090,
        groups => ['ring-users'],
    }

##### END gossamerthreads #####

##### BEGIN towardex #####

    @add_user { 'towardex':
        email => 'ip-admin@twdx.net',
        company => 'TowardEX Carrier Services',
        uid => 5091,
        groups => ['ring-users'],
    }

##### END towardex #####

##### BEGIN simplytransit #####

    @add_user { 'simplytransit':
        email => 'nt@names.co.uk',
        company => 'Simply Transit',
        uid => 5092,
        groups => ['ring-users'],
    }

##### END simplytransit #####

##### BEGIN isarnet #####

    @add_user { 'isarnet':
        email => 'noc@isarnet.de',
        company => 'IsarNet AG',
        uid => 5093,
        groups => ['ring-users'],
    }

##### END isarnet #####

##### BEGIN strato #####

    @add_user { 'strato':
        email => 'noc@strato-rz.de',
        company => 'STRATO AG',
        uid => 5094,
        groups => ['ring-users'],
    }

##### END strato #####

##### BEGIN edutel #####

    @add_user { 'edutel':
        email => 'noc@edutel.nl',
        company => 'Edutel B.V.',
        uid => 5095,
        groups => ['ring-users'],
    }

##### END edutel #####

##### BEGIN sixdegrees #####

    @add_user { 'sixdegrees':
        email => 'noc@6dg.co.uk',
        company => 'Six Degrees Group',
        uid => 5096,
        groups => ['ring-users'],
    }

##### END sixdegrees #####

##### BEGIN spacedump #####

    @add_user { 'spacedump':
        email => 'registry@spacedump.se',
        company => 'SpaceDump IT AB',
        uid => 5097,
        groups => ['ring-users'],
    }

##### END spacedump #####

##### BEGIN yourorg #####

    @add_user { 'yourorg':
        email => 'noc@your.org',
        company => 'Your.Org',
        uid => 5099,
        groups => ['ring-users'],
    }

##### END yourorg #####

##### BEGIN occaid #####

    @add_user { 'occaid':
        email => 'noc@occaid.org',
        company => 'OCCAID, Inc',
        uid => 5100,
        groups => ['ring-users'],
    }

##### END occaid #####

##### BEGIN as250net #####

    @add_user { 'as250net':
        email => 'noc@as250.net',
        company => 'AS250.net',
        uid => 5101,
        groups => ['ring-users'],
    }

##### END as250net #####

##### BEGIN redpilllinpro #####

    @add_user { 'redpilllinpro':
        email => 'noc@redpill-linpro.com',
        company => 'Redpill Linpro',
        uid => 5102,
        groups => ['ring-users'],
    }

##### END redpilllinpro #####

##### BEGIN nine #####

    @add_user { 'nine':
        email => 'noc@nine.ch',
        company => 'Nine Internet Solutions AG',
        uid => 5103,
        groups => ['ring-users'],
    }

##### END nine #####

##### BEGIN oneandone #####

    @add_user { 'oneandone':
        email => 'noc@oneandone.net',
        company => '1&1 Internet AG',
        uid => 5104,
        groups => ['ring-users'],
    }

##### END oneandone #####

##### BEGIN belwue #####

    @add_user { 'belwue':
        email => 'ip@belwue.de',
        company => 'BelWü',
        uid => 5105,
        groups => ['ring-users'],
    }

##### END belwue #####

##### BEGIN lagis #####

    @add_user { 'lagis':
        email => 'sysadmin@lagis.at',
        company => 'lagis Internet Serviceprovider GmbH',
        uid => 5106,
        groups => ['ring-users'],
    }

##### END lagis #####

##### BEGIN fnutt #####

    @add_user { 'fnutt':
        email => 'peering@fnutt.net',
        company => 'Fnutt Consulting',
        uid => 5107,
        groups => ['ring-users'],
    }

##### END fnutt #####

##### BEGIN sidn #####

    @add_user { 'sidn':
        email => 'unixbeheer@sidn.nl',
        company => 'SIDN',
        uid => 5108,
        groups => ['ring-users'],
    }

##### END sidn #####

##### BEGIN melbourne #####

    @add_user { 'melbourne':
        email => 'support.team@melbourne.co.uk',
        company => 'Melbourne Server Hosting',
        uid => 5109,
        groups => ['ring-users'],
    }

##### END melbourne #####

##### BEGIN brendon-wand #####

    @add_user { 'brendon-wand':
        email => 'brendonj@cs.waikato.ac.nz',
        company => 'Brendon Jones',
        uid => 5110,
        groups => ['ring-users'],
    }

##### END brendon-wand #####

##### BEGIN go6lab #####

    @add_user { 'go6lab':
        email => 'jan@go6.si',
        company => 'Go6 Institute',
        uid => 5111,
        groups => ['ring-users'],
    }

##### END go6lab #####

##### BEGIN siminn #####

    @add_user { 'siminn':
        email => 'drift@siminn.dk',
        company => 'Siminn Danmark',
        uid => 5112,
        groups => ['ring-users'],
    }

##### END siminn #####

##### BEGIN a2binternet #####

    @add_user { 'a2binternet':
        email => 'noc@a2b-internet.com',
        company => 'A2B Internet B.V.',
        uid => 5113,
        groups => ['ring-users'],
    }

##### END a2binternet #####

##### BEGIN i3d #####

    @add_user { 'i3d':
        email => 'noc2@i3d.nl',
        company => 'Interactive 3D',
        uid => 5114,
        groups => ['ring-users'],
    }

##### END i3d #####

##### BEGIN viatel #####

    @add_user { 'viatel':
        email => 'noc@viatel.com',
        company => 'Viatel',
        uid => 5264,
        groups => ['ring-users'],
    }

##### END viatel #####

##### BEGIN sidnrd #####

    @add_user { 'sidnrd':
        email => 'unixbeheer@sidnrd.nl',
        company => 'SIDN',
        uid => 5116,
        groups => ['ring-users'],
    }

##### END sidnrd #####

##### BEGIN keenondots #####

    @add_user { 'keenondots':
        email => 'support@keenondots.com',
        company => 'Keen on Dots',
        uid => 5117,
        groups => ['ring-users'],
    }

##### END keenondots #####

##### BEGIN obenetwork #####

    @add_user { 'obenetwork':
        email => 'noc@obenetwork.com',
        company => 'Obenetwork AB',
        uid => 5118,
        groups => ['ring-users'],
    }

##### END obenetwork #####

##### BEGIN infomaniak #####

    @add_user { 'infomaniak':
        email => 'operator@infomaniak.ch',
        company => 'Infomaniak Network SA',
        uid => 5119,
        groups => ['ring-users'],
    }

##### END infomaniak #####

##### BEGIN teamix #####

    @add_user { 'teamix':
        email => 'rg@teamix.de',
        company => 'teamix GmbH',
        uid => 5120,
        groups => ['ring-users'],
    }

##### END teamix #####

##### BEGIN skyway #####

    @add_user { 'skyway':
        email => 'noc@skyway-dc.com',
        company => 'SKYWAY DataCenter GmbH',
        uid => 5122,
        groups => ['ring-users'],
    }

##### END skyway #####

##### BEGIN solcon #####

    @add_user { 'solcon':
        email => 'noc@isp.solcon.nl',
        company => 'Solcon Internetdiensten B.V.',
        uid => 5123,
        groups => ['ring-users'],
    }

##### END solcon #####

##### BEGIN claranet #####

    @add_user { 'claranet':
        email => 'ring@eu.clara.net',
        company => 'Claranet',
        uid => 5124,
        groups => ['ring-users'],
    }

##### END claranet #####

##### BEGIN arpnetworks #####

    @add_user { 'arpnetworks':
        email => 'noc@arpnetworks.com',
        company => 'ARP Networks, Inc.',
        uid => 5125,
        groups => ['ring-users'],
    }

##### END arpnetworks #####

##### BEGIN iabg #####

    @add_user { 'iabg':
        email => 'ip@teleport-iabg.de',
        company => 'IABG mbH - Teleport',
        uid => 5126,
        groups => ['ring-users'],
    }

##### END iabg #####

##### BEGIN initseven #####

    @add_user { 'initseven':
        email => 'noc@init7.net',
        company => 'INIT7',
        uid => 5127,
        groups => ['ring-users'],
    }

##### END initseven #####

##### BEGIN hosting90systems #####

    @add_user { 'hosting90systems':
        email => 'admin@hosting90.cz',
        company => 'HOSTING90 systems s.r.o.',
        uid => 5128,
        groups => ['ring-users'],
    }

##### END hosting90systems #####

##### BEGIN kordia #####

    @add_user { 'kordia':
        email => 'smc@kordia.co.nz',
        company => 'Kordia',
        uid => 5129,
        groups => ['ring-users'],
    }

##### END kordia #####

##### BEGIN backbone #####

    @add_user { 'backbone':
        email => 'afink@backbone.is',
        company => 'Backbone ehf',
        uid => 5131,
        groups => ['ring-users'],
    }

##### END backbone #####

##### BEGIN nexellent #####

    @add_user { 'nexellent':
        email => 'noc@nexellent.net',
        company => 'nexellent AG',
        uid => 5132,
        groups => ['ring-users'],
    }

##### END nexellent #####

##### BEGIN afilias #####

    @add_user { 'afilias':
        email => 'cpr@afilias.info',
        company => 'Afilias',
        uid => 5133,
        groups => ['ring-users'],
    }

##### END afilias #####

##### BEGIN grnet #####

    @add_user { 'grnet':
        email => 'noc@noc.grnet.gr',
        company => 'GRNET',
        uid => 5134,
        groups => ['ring-users'],
    }

##### END grnet #####

##### BEGIN netflix #####

    @add_user { 'netflix':
        email => 'cdnetops@netflix.com',
        company => 'Netflix',
        uid => 5135,
        groups => ['ring-users'],
    }

##### END netflix #####

##### BEGIN ipmax #####

    @add_user { 'ipmax':
        email => 'noc@ip-max.net',
        company => 'IP-Max',
        uid => 5136,
        groups => ['ring-users'],
    }

##### END ipmax #####

##### BEGIN merit #####

    @add_user { 'merit':
        email => 'msc@merit.edu',
        company => 'Merit Network, Inc',
        uid => 5137,
        groups => ['ring-users'],
    }

##### END merit #####

##### BEGIN poznan #####

    @add_user { 'poznan':
        email => 'ipv6-support@man.poznan.pl',
        company => 'Poznan Supercomputing and Networking Center',
        uid => 5138,
        groups => ['ring-users'],
    }

##### END poznan #####

##### BEGIN bluezonejordan #####

    @add_user { 'bluezonejordan':
        email => 'noc@bluezonejordan.com',
        company => 'Bluezone Jordan',
        uid => 5140,
        groups => ['ring-users'],
    }

##### END bluezonejordan #####

##### BEGIN zeronet #####

    @add_user { 'zeronet':
        email => 'noc@zero.net.uk',
        company => 'zero.net.uk',
        uid => 5141,
        groups => ['ring-users'],
    }

##### END zeronet #####

##### BEGIN rgnet #####

    @add_user { 'rgnet':
        email => 'noc@rg.net',
        company => 'RGnet LLC / psg.com',
        uid => 5142,
        groups => ['ring-users'],
    }

##### END rgnet #####

##### BEGIN ehsab #####

    @add_user { 'ehsab':
        email => 'teknik@excellent-hosting.se',
        company => 'Excellent Hosting Sweden AB',
        uid => 5143,
        groups => ['ring-users'],
    }

##### END ehsab #####

##### BEGIN yellowfiber #####

    @add_user { 'yellowfiber':
        email => 'support@yellowfiber.net',
        company => 'Yellow Fiber Networks',
        uid => 5144,
        groups => ['ring-users'],
    }

##### END yellowfiber #####

##### BEGIN bahnhof #####

    @add_user { 'bahnhof':
        email => 'ncc@bahnhof.net',
        company => 'Bahnhof',
        uid => 5145,
        groups => ['ring-users'],
    }

##### END bahnhof #####

##### BEGIN nicchile #####

    @add_user { 'nicchile':
        email => 'noc@nic.cl',
        company => 'Universidad de Chile - NIC Chile',
        uid => 5146,
        groups => ['ring-users'],
    }

##### END nicchile #####

##### BEGIN glesys #####

    @add_user { 'glesys':
        email => 'noc@glesys.se',
        company => 'GleSYS Internet Services AB',
        uid => 5147,
        groups => ['ring-users'],
    }

##### END glesys #####

##### BEGIN rcsrds #####

    @add_user { 'rcsrds':
        email => 'noc@ploiesti.rdsnet.ro',
        company => 'S.C. RCS RDS S.A.',
        uid => 5148,
        groups => ['ring-users'],
    }

##### END rcsrds #####

##### BEGIN itmastaren #####

    @add_user { 'itmastaren':
        email => ' registry@itmastaren.se',
        company => 'IT-mästaren Mitt AB',
        uid => 5150,
        groups => ['ring-users'],
    }

##### END itmastaren #####

##### BEGIN openminds #####

    @add_user { 'openminds':
        email => 'tech@openminds.be',
        company => 'Openminds bvba',
        uid => 5151,
        groups => ['ring-users'],
    }

##### END openminds #####

##### BEGIN one #####

    @add_user { 'one':
        email => 'network@one.com',
        company => 'One.com',
        uid => 5152,
        groups => ['ring-users'],
    }

##### END one #####

##### BEGIN heanet #####

    @add_user { 'heanet':
        email => 'noc@heanet.ie',
        company => 'HEAnet',
        uid => 5155,
        groups => ['ring-users'],
    }

##### END heanet #####

##### BEGIN algar #####

    @add_user { 'algar':
        email => 'cordados@ctbc.com.br',
        company => 'Algar Telecom',
        uid => 5156,
        groups => ['ring-users'],
    }

##### END algar #####

##### BEGIN qbranch #####

    @add_user { 'qbranch':
        email => 'networking@qbranch.se',
        company => 'Qbranch Services AB',
        uid => 5157,
        groups => ['ring-users'],
    }

##### END qbranch #####

##### BEGIN nlnetlabs #####

    @add_user { 'nlnetlabs':
        email => 'tech-admin@nlnetlabs.nl',
        company => 'NLnet Labs',
        uid => 5158,
        groups => ['ring-users'],
    }

##### END nlnetlabs #####

##### BEGIN entanet #####

    @add_user { 'entanet':
        email => 'noc@enta.net',
        company => 'Entanet',
        uid => 5159,
        groups => ['ring-users'],
    }

##### END entanet #####

##### BEGIN ripe #####

    @add_user { 'ripe':
        email => 'netops@ripe.net',
        company => 'RIPE NCC',
        uid => 5160,
        groups => ['ring-users'],
    }

##### END ripe #####

##### BEGIN hosteurope #####

    @add_user { 'hosteurope':
        email => 'noc@hosteurope.de',
        company => 'Host Europe GmbH',
        uid => 5161,
        groups => ['ring-users'],
    }

##### END hosteurope #####

##### BEGIN wirehive #####

    @add_user { 'wirehive':
        email => 'support@wirehive.net',
        company => 'Wirehive Ltd',
        uid => 5162,
        groups => ['ring-users'],
    }

##### END wirehive #####

##### BEGIN superonline #####

    @add_user { 'superonline':
        email => 'TEAM-IPMPLS@superonline.net',
        company => 'Turkcell Superonline',
        uid => 5163,
        groups => ['ring-users'],
    }

##### END superonline #####

##### BEGIN nforce #####

    @add_user { 'nforce':
        email => 'noc@nforce.com',
        company => 'NFOrce Entertainment B.V.',
        uid => 5164,
        groups => ['ring-users'],
    }

##### END nforce #####

##### BEGIN xing #####

    @add_user { 'xing':
        email => 'xing-nog@lists.xing.com',
        company => 'XING AG',
        uid => 5165,
        groups => ['ring-users'],
    }

##### END xing #####

##### BEGIN serverchoice #####

    @add_user { 'serverchoice':
        email => 'noc@serverchoice.com',
        company => 'ServerChoice Ltd',
        uid => 5166,
        groups => ['ring-users'],
    }

##### END serverchoice #####

##### BEGIN bredband2 #####

    @add_user { 'bredband2':
        email => 'noc@bredband2.se',
        company => 'Bredband2 AB',
        uid => 5167,
        groups => ['ring-users'],
    }

##### END bredband2 #####

##### BEGIN cdw #####

    @add_user { 'cdw':
        email => 'manshelp@cdw.com',
        company => 'CDW',
        uid => 5168,
        groups => ['ring-users'],
    }

##### END cdw #####

##### BEGIN linxtelecom #####

    @add_user { 'linxtelecom':
        email => 'noc@linxtelecom.com',
        company => 'Linxtelecom',
        uid => 5169,
        groups => ['ring-users'],
    }

##### END linxtelecom #####

##### BEGIN underworld #####
    
    @add_user { 'underworld':
        email => 'noc@underworld.no',
        company => 'Underworld',
        uid => 5170,
        groups => ['ring-users'],
    }

##### END underworld #####

##### BEGIN adminor #####

    @add_user { 'adminor':
        email => 'noc@adminor.net',
        company => 'Adminor AB',
        uid => 5171,
        groups => ['ring-users'],
    }

##### END adminor #####

##### BEGIN videoplaza #####

    @add_user { 'videoplaza':
        email => 'noc@videoplaza.com',
        company => 'Videoplaza AB',
        uid => 5172,
        groups => ['ring-users'],
    }

##### END videoplaza #####

##### BEGIN rnp #####

    @add_user { 'rnp':
        email => 'noc@rnp.br',
        company => 'RNP',
        uid => 5173,
        groups => ['ring-users'],
    }

##### END rnp #####

##### BEGIN iij #####

    @add_user { 'iij':
        email => 'noc@iij.ad.jp',
        company => 'IIJ',
        uid => 5174,
        groups => ['ring-users'],
    }

##### END iij #####

##### BEGIN beanfield #####

    @add_user { 'beanfield':
        email => 'noc@beanfield.com',
        company => 'Beanfield Technologies',
        uid => 5175,
        groups => ['ring-users'],
    }

##### END beanfield #####

##### BEGIN serioustubes #####

    @add_user { 'serioustubes':
        email => 'noc@serioustubes.se',
        company => 'Serious Tubes Networks',
        uid => 5176,
        groups => ['ring-users'],
    }

##### END serioustubes #####

##### BEGIN direcpath #####

    @add_user { 'direcpath':
        email => 'engr@direcpath.com',
        company => 'Direcpath, LLC',
        uid => 5177,
        groups => ['ring-users'],
    }

##### END direcpath #####

##### BEGIN dcsone #####

    @add_user { 'dcsone':
        email => 'noc@dcs1.biz',
        company => 'DCS1 Pte Ltd',
        uid => 5178,
        groups => ['ring-users'],
    }

##### END dcsone #####

##### BEGIN berkeley #####

    @add_user { 'berkeley':
        email => 'noc@nak.berkeley.edu',
        company => 'University of California at Berkeley',
        uid => 5179,
        groups => ['ring-users'],
    }

##### END berkeley #####

##### BEGIN ispservices #####

    @add_user { 'ispservices':
        email => 'noc@isp-services.nl',
        company => 'ISP Services',
        uid => 5180,
        groups => ['ring-users'],
    }

##### END ispservices #####

##### BEGIN ausregistry #####

    @add_user { 'ausregistry':
        email => 'netadmin@ausregistry.com.au',
        company => 'AusRegistry',
        uid => 5181,
        groups => ['ring-users'],
    }

##### END ausregistry #####

##### BEGIN switch #####

    @add_user { 'switch':
        email => 'noc@switch.ch',
        company => 'SWITCH',
        uid => 5182,
        groups => ['ring-users'],
    }

##### END switch #####

##### BEGIN hurricane #####

    @add_user { 'hurricane':
        email => 'noc@he.net',
        company => 'Hurricane Electric',
        uid => 5183,
        groups => ['ring-users'],
    }

##### END hurricane #####

##### BEGIN proserve #####

    @add_user { 'proserve':
        email => 'noc@proserve.nl',
        company => 'Proserve B.V.',
        uid => 5184,
        groups => ['ring-users'],
    }

##### END proserve #####

##### BEGIN teletalk #####

    @add_user { 'teletalk':
        email => 'noc@teletalk.com.br',
        company => 'Teletalk Telecomunications Ltda',
        uid => 5185,
        groups => ['ring-users'],
    }

##### END teletalk #####

##### BEGIN poppr #####

    @add_user { 'poppr':
        email => 'admnet@pop-pr.rnp.br',
        company => 'PoP-PR',
        uid => 5186,
        groups => ['ring-users'],
    }

##### END poppr #####

##### BEGIN kaiaglobal #####

    @add_user { 'kaiaglobal':
        email => 'cust.noc@nmc.kaiaglobal.com',
        company => 'Kaia Global Networks Ltd.',
        uid => 5187,
        groups => ['ring-users'],
    }

##### END kaiaglobal #####

##### BEGIN enestdata #####

    @add_user { 'enestdata':
        email => 'noc@e-nestdata.ch',
        company => 'e-nestdata SA',
        uid => 5188,
        groups => ['ring-users'],
    }

##### END enestdata #####

##### BEGIN ualbany #####

    @add_user { 'ualbany':
        email => 'noc@albany.edu',
        company => 'University at Albany',
        uid => 5190,
        groups => ['ring-users'],
    }

##### END ualbany #####

##### BEGIN masterinternet #####

    @add_user { 'masterinternet':
        email => 'support@master.cz',
        company => 'Master Internet s.r.o.',
        uid => 5191,
        groups => ['ring-users'],
    }

##### END masterinternet #####

##### BEGIN icanndns #####

    @add_user { 'icanndns':
        email => 'noc@dns.icann.org',
        company => 'ICANN DNS Operations',
        uid => 5192,
        groups => ['ring-users'],
    }

##### END icanndns #####

##### BEGIN intellit #####

    @add_user { 'intellit':
        email => 'noc@intellit.no',
        company => 'INTELLIT AS',
        uid => 5193,
        groups => ['ring-users'],
    }

##### END intellit #####

##### BEGIN onet #####

    @add_user { 'onet':
        email => 'noc@onet.pl',
        company => 'Grupa Onet.pl S.A.',
        uid => 5194,
        groups => ['ring-users'],
    }

##### END onet #####

##### BEGIN msu #####

    @add_user { 'msu':
        email => 'noc@msu.ru',
        company => 'Lomonosov Moscow State University',
        uid => 5195,
        groups => ['ring-users'],
    }

##### END msu #####

##### BEGIN robtex #####

    @add_user { 'robtex':
        email => 'team@robtex.com',
        company => 'Robtex.com',
        uid => 5196,
        groups => ['ring-users'],
    }

##### END robtex #####

##### BEGIN dyn #####

    @add_user { 'dyn':
        email => 'noc@dyn.com',
        company => 'Dyn',
        uid => 5197,
        groups => ['ring-users'],
    }

##### END dyn #####

##### BEGIN trueinternet #####

    @add_user { 'trueinternet':
        email => 'corpsupport@trueinternet.co.th',
        company => 'True Internet Co., Ltd.',
        uid => 5198,
        groups => ['ring-users'],
    }

##### END trueinternet #####

##### BEGIN phusion #####

    @add_user { 'phusion':
        email => 'noc@phusionim.com',
        company => 'Phusion',
        uid => 5199,
        groups => ['ring-users'],
    }

##### END phusion #####

##### BEGIN nimag #####

    @add_user { 'nimag':
        email => 'noc@nimag.net',
        company => 'Nimag Networks S?rl',
        uid => 5200,
        groups => ['ring-users'],
    }

##### END nimag #####

##### BEGIN vancis #####

    @add_user { 'vancis':
        email => 'noc@vancis.nl',
        company => 'Vancis',
        uid => 5201,
        groups => ['ring-users'],
    }

##### END vancis #####

##### BEGIN es #####

    @add_user { 'es':
        email => 'trouble@es.net',
        company => 'Energy Sciences Network (US Department of Energy)',
        uid => 5202,
        groups => ['ring-users'],
    }

##### END es #####

##### BEGIN world4you #####

    @add_user { 'world4you':
        email => 'noc@world4you.com',
        company => 'World4You Internet Services GmbH',
        uid => 5203,
        groups => ['ring-users'],
    }

##### END world4you #####

##### BEGIN 4ddc #####

    @add_user { '4ddc':
        email => 'networkops@4d-dc.com',
        company => '4D Data Centres Ltd',
        uid => 5204,
        groups => ['ring-users'],
    }

##### END 4ddc #####

##### BEGIN rackfish #####

    @add_user { 'rackfish':
        email => 'registry@rackfish.com',
        company => 'Rackfish AB',
        uid => 5205,
        groups => ['ring-users'],
    }

##### END rackfish #####

##### BEGIN doruknet #####

    @add_user { 'doruknet':
        email => 'noc@doruk.net.tr',
        company => 'Doruknet',
        uid => 5206,
        groups => ['ring-users'],
    }

##### END doruknet #####

##### BEGIN vocus #####

    @add_user { 'vocus':
        email => 'network@vocus.com.au',
        company => 'Vocus Communications',
        uid => 5207,
        groups => ['ring-users'],
    }

##### END vocus #####

##### BEGIN hostvirtual #####

    @add_user { 'hostvirtual':
        email => 'tech@vr.org',
        company => 'Host Virtual, Inc',
        uid => 5208,
        groups => ['ring-users'],
    }

##### END hostvirtual #####

##### BEGIN mozilla #####

    @add_user { 'mozilla':
        email => 'netops@mozilla.com',
        company => 'Mozilla',
        uid => 5209,
        groups => ['ring-users'],
    }

##### END mozilla #####

##### BEGIN lightstorm #####

    @add_user { 'lightstorm':
        email => 'csc@lightstorm.sk',
        company => 'LightStorm Communications s.r.o.',
        uid => 5210,
        groups => ['ring-users'],
    }

##### END lightstorm #####

##### BEGIN iccn #####

    @add_user { 'iccn':
        email => 'ICCN-SUPPORT-L@LISTSERV.ILLINOIS.EDU',
        company => 'ICCN',
        uid => 5211,
        groups => ['ring-users'],
    }

##### END iccn #####

##### BEGIN popsc #####

    @add_user { 'popsc':
        email => 'noc@pop-sc.rnp.br',
        company => 'PoP-SC',
        uid => 5212,
        groups => ['ring-users'],
    }

##### END popsc #####

##### BEGIN sargasso #####

    @add_user { 'sargasso':
        email => 'noc@sargasso.net',
        company => 'Sargasso Networks',
        uid => 5213,
        groups => ['ring-users'],
    }

##### END sargasso #####

##### BEGIN mythicbeasts #####

    @add_user { 'mythicbeasts':
        email => 'support@mythic-beasts.com',
        company => 'Mythic Beasts Ltd',
        uid => 5214,
        groups => ['ring-users'],
    }

##### END mythicbeasts #####

##### BEGIN transip #####

    @add_user { 'transip':
        email => 'noc@transip.nl',
        company => 'TransIP B.V.',
        uid => 5215,
        groups => ['ring-users'],
    }

##### END transip #####

##### BEGIN sapphire #####

    @add_user { 'sapphire':
        email => 'noc@sapphire.gi',
        company => 'Sapphire Networks',
        uid => 5216,
        groups => ['ring-users'],
    }

##### END sapphire #####

##### BEGIN octopuce #####

    @add_user { 'octopuce':
        email => 'noc@octopuce.fr',
        company => 'Octopuce',
        uid => 5217,
        groups => ['ring-users'],
    }

##### END octopuce #####

##### BEGIN udomain #####

    @add_user { 'udomain':
        email => 'noc@udomain.com.hk',
        company => 'UDomain Web Hosting Co.Ltd',
        uid => 5218,
        groups => ['ring-users'],
    }

##### END udomain #####

##### BEGIN ipvisie #####

    @add_user { 'ipvisie':
        email => 'networking@ipvisie.com',
        company => 'IP Visie Networking B.V.',
        uid => 5219,
        groups => ['ring-users'],
    }

##### END ipvisie #####

##### BEGIN citynetwork #####

    @add_user { 'citynetwork':
        email => 'jh@citynetwork.se',
        company => 'City Network Hosting AB',
        uid => 5220,
        groups => ['ring-users'],
    }

##### END citynetwork #####

##### BEGIN iplan #####

    @add_user { 'iplan':
        email => 'parduino@iplan.com.ar',
        company => 'IPLAN',
        uid => 5221,
        groups => ['ring-users'],
    }

##### END iplan #####

##### BEGIN magyar #####

    @add_user { 'magyar':
        email => 'noc.fix@telekom.hu',
        company => 'Magyar Telekom',
        uid => 5222,
        groups => ['ring-users'],
    }

##### END magyar #####

##### BEGIN luna #####

    @add_user { 'luna':
        email => 'noc@luna.nl',
        company => 'luna',
        uid => 5223,
        groups => ['ring-users'],
    }

##### END luna #####

##### BEGIN combell #####

    @add_user { 'combell':
        email => 'abuse@combell.com',
        company => 'COMBELLGROUP NV',
        uid => 5224,
        groups => ['ring-users'],
    }

##### END combell #####

##### BEGIN infostrada #####

    @add_user { 'infostrada':
        email => 'noc@infostrada.com',
        company => 'Infostrada',
        uid => 5225,
        groups => ['ring-users'],
    }

##### END infostrada #####

##### BEGIN blacklotus #####

    @add_user { 'blacklotus':
        email => 'noc@blacklotus.net',
        company => 'Black Lotus Communications',
        uid => 5226,
        groups => ['ring-users'],
    }

##### END blacklotus #####

##### BEGIN stargate #####

    @add_user { 'stargate':
        email => 'peering@stargate.ca',
        company => 'Stargate Connections Inc.',
        uid => 5227,
        groups => ['ring-users'],
    }

##### END stargate #####

##### BEGIN etop #####

    @add_user { 'etop':
        email => 'noc@etop.pl',
        company => 'Etop Sp. z o.o.',
        uid => 5228,
        groups => ['ring-users'],
    }

##### END etop #####

##### BEGIN dragon #####

    @add_user { 'dragon':
        email => 'noc@dragon.cz',
        company => 'Dragon Internet a.s.',
        uid => 5229,
        groups => ['ring-users'],
    }

##### END dragon #####

##### BEGIN 2connect #####

    @add_user { '2connect':
        email => 'noc@2connect.cz',
        company => '2 connect',
        uid => 5230,
        groups => ['ring-users'],
    }

##### END 2connect #####

##### BEGIN syseleven #####

    @add_user { 'syseleven':
        email => 'ip@syseleven.de',
        company => 'SysEleven GmbH',
        uid => 5231,
        groups => ['ring-users'],
    }

##### END syseleven #####

##### BEGIN vertixo #####

    @add_user { 'vertixo':
        email => 'noc@vxbits.net',
        company => 'Vertixo B.V',
        uid => 5232,
        groups => ['ring-users'],
    }

##### END vertixo #####

##### BEGIN inerail #####

    @add_user { 'inerail':
        email => 'noc@inerail.net',
        company => 'Inerail',
        uid => 5233,
        groups => ['ring-users'],
    }

##### END inerail #####

##### BEGIN kwaoo #####

    @add_user { 'kwaoo':
        email => 'noc@kwaoo.net',
        company => 'Kwaoo',
        uid => 5234,
        groups => ['ring-users'],
    }

##### END kwaoo #####

##### BEGIN atlanticmetro #####

    @add_user { 'atlanticmetro':
        email => 'support@atlanticmetro.net',
        company => 'Atlantic Metro Communications',
        uid => 5235,
        groups => ['ring-users'],
    }

##### END atlanticmetro #####

##### BEGIN esgob #####

    @add_user { 'esgob':
        email => 'noc@esgob.com',
        company => 'Esgob Ltd',
        uid => 5236,
        groups => ['ring-users'],
    }

##### END esgob #####

##### BEGIN itsbrasil #####

    @add_user { 'itsbrasil':
        email => 'redes@itsbrasil.net',
        company => 'ITS Telecomunicacoes',
        uid => 5237,
        groups => ['ring-users'],
    }

##### END itsbrasil #####

##### BEGIN finecom #####

    @add_user { 'finecom':
        email => 'engineering@finecom.ch',
        company => 'Finecom Telecommunications AG',
        uid => 5238,
        groups => ['ring-users'],
    }

##### END finecom #####

##### BEGIN sbtap #####

    @add_user { 'sbtap':
        email => 'noc@as59715.net',
        company => 'SBTAP',
        uid => 5239,
        groups => ['ring-users'],
    }

##### END sbtap #####

##### BEGIN spotify #####

    @add_user { 'spotify':
        email => 'xnet@spotify.com',
        company => 'Spotify',
        uid => 5240,
        groups => ['ring-users'],
    }

##### END spotify #####

##### BEGIN xconnect #####

    @add_user { 'xconnect':
        email => 'noc@xconnect24.net',
        company => 'Xconnect24',
        uid => 5241,
        groups => ['ring-users'],
    }

##### END xconnect #####

##### BEGIN amsio #####

    @add_user { 'amsio':
        email => 'noc@amsio.com',
        company => 'Amsio B.V.',
        uid => 5242,
        groups => ['ring-users'],
    }

##### END amsio #####

##### BEGIN goscomb #####

    @add_user { 'goscomb':
        email => 'noc@goscomb.net',
        company => 'HighSpeed Office t/a Goscomb',
        uid => 5243,
        groups => ['ring-users'],
    }

##### END goscomb #####

##### BEGIN kinber #####

    @add_user { 'kinber':
        email => 'noc@pennren.net',
        company => 'KINBER - Keystone Initiative for Network Based Education and Research',
        uid => 5244,
        groups => ['ring-users'],
    }

##### END kinber #####

##### BEGIN nonattached #####

    @add_user { 'nonattached':
        email => 'mail@danrl.de',
        company => 'Nonattached Network',
        uid => 5245,
        groups => ['ring-users'],
    }

##### END nonattached #####

##### BEGIN kpn #####

    @add_user { 'kpn':
        email => 'noc-international@kpn.com',
        company => 'KPN International',
        uid => 5247,
        groups => ['ring-users'],
    }

##### END kpn #####

##### BEGIN suomi #####

    @add_user { 'suomi':
        email => 'noc@suomicom.fi',
        company => 'Suomi Communications oy',
        uid => 5246,
        groups => ['ring-users'],
    }

##### END suomi #####

##### BEGIN flhsi #####

    @add_user { 'flhsi':
        email => 'noc@flhsi.com',
        company => 'Florida High Speed Internet',
        uid => 5249,
        groups => ['ring-users'],
    }

##### END flhsi #####

##### BEGIN virtualone #####

    @add_user { 'virtualone':
        email => 'ninjas@virtual1.com',
        company => 'Virtual1',
        uid => 5250,
        groups => ['ring-users'],
    }

##### END virtualone #####

##### BEGIN swisscom #####

    @add_user { 'swisscom':
        email => 'engineering@ip-plus.net',
        company => 'Swisscom IP-Plus',
        uid => 5251,
        groups => ['ring-users'],
    }

##### END swisscom #####

##### BEGIN maxitel #####

    @add_user { 'maxitel':
        email => 'noc@maxitel.nl',
        company => 'MaxiTEL Telecom B.V.',
        uid => 5248,
        groups => ['ring-users'],
    }

##### END maxitel #####

##### BEGIN telus #####

    @add_user { 'telus':
        email => 'ipnoc@telus.com',
        company => 'TELUS',
        uid => 5252,
        groups => ['ring-users'],
    }

##### END telus #####

##### BEGIN selectel #####

    @add_user { 'selectel':
        email => 'akme@selectel.ru',
        company => 'Selectel Ltd',
        uid => 5253,
        groups => ['ring-users'],
    }

##### END selectel #####

##### BEGIN sne #####

    @add_user { 'sne':
        email => 'stefan.plug@ams-ix.net',
        company => 'SNE Students',
        uid => 5254,
        groups => ['ring-users'],
    }

##### END sne #####

##### BEGIN infowest #####

    @add_user { 'infowest':
        email => 'netops@infowest.com',
        company => 'InfoWest, Inc',
        uid => 5255,
        groups => ['ring-users'],
    }

##### END infowest #####

##### BEGIN funet #####

    @add_user { 'funet':
        email => 'noc@funet.fi',
        company => 'CSC/Funet',
        uid => 5256,
        groups => ['ring-users'],
    }

##### END funet #####

##### BEGIN dcenterpl #####

    @add_user { 'dcenterpl':
        email => 'noc@dcenter.pl',
        company => 'dcenter.pl sp. z o. o.',
        uid => 5257,
        groups => ['ring-users'],
    }

##### END dcenterpl #####

##### BEGIN cybercom #####

    @add_user { 'cybercom':
        email => 'netadm@hard.ware.fi',
        company => 'Cybercom Finland Oy',
        uid => 5258,
        groups => ['ring-users'],
    }

##### END cybercom #####

##### BEGIN hivane #####

    @add_user { 'hivane':
        email => 'noc@hivane.net',
        company => 'Hivane',
        uid => 5259,
        groups => ['ring-users'],
    }

##### END hivane #####

##### BEGIN fullsave #####

    @add_user { 'fullsave':
        email => 'support@fullsave.com',
        company => 'FullSave',
        uid => 5260,
        groups => ['ring-users'],
    }

##### END fullsave #####

##### BEGIN telecityfi #####

    @add_user { 'telecityfi':
        email => 'fi.noc@telecity.com',
        company => 'TelecityGroup Finland Oy',
        uid => 5261,
        groups => ['ring-users'],
    }

##### END telecityfi #####

##### BEGIN itps #####

    @add_user { 'itps':
        email => 'peering@itps.co.uk',
        company => 'IT Professional Services Ltd',
        uid => 5262,
        groups => ['ring-users'],
    }

##### END itps #####

##### BEGIN cyberverse #####

    @add_user { 'cyberverse':
        email => 'support@cyberverse.com',
        company => 'Cyberverse, Inc.',
        uid => 5263,
        groups => ['ring-users'],
    }

##### END cyberverse #####

##### BEGIN ntt #####

    @add_user { 'ntt':
        email => 'noc@us.ntt.net',
        company => 'NTT',
        uid => 5265,
        groups => ['ring-users'],
    }

##### END ntt #####

##### BEGIN bogalnet #####

    @add_user { 'bogalnet':
        email => 'noc@bogalnet.se',
        company => 'Bogal AB',
        uid => 5266,
        groups => ['ring-users'],
    }

##### END bogalnet #####

##### BEGIN iucc #####

    @add_user { 'iucc':
        email => 'nocplus@noc.ilan.net.il',
        company => 'IUCC',
        uid => 5267,
        groups => ['ring-users'],
    }

##### END iucc #####

##### BEGIN nynex #####

    @add_user { 'nynex':
        email => 'noc@nynex.de',
        company => 'NYNEX',
        uid => 5268,
        groups => ['ring-users'],
    }

##### END nynex #####

##### BEGIN businessconnect #####

    @add_user { 'businessconnect':
        email => 'noc@businessconnect.nl',
        company => 'BusinessConnect BV',
        uid => 5269,
        groups => ['ring-users'],
    }

##### END businessconnect #####

##### BEGIN noris #####

    @add_user { 'noris':
        email => 'noc@noris.net',
        company => 'noris network AG',
        uid => 5270,
        groups => ['ring-users'],
    }

##### END noris #####

##### BEGIN mknetzdienste #####

    @add_user { 'mknetzdienste':
        email => 'noc@mk.de',
        company => 'MK Netzdienste GmbH & Co. KG',
        uid => 5271,
        groups => ['ring-users'],
    }

##### END mknetzdienste #####

##### BEGIN suretec #####

    @add_user { 'suretec':
        email => 'noc@suretec.net',
        company => 'Suretec Systems Ltd. T/A SureVoIP',
        uid => 5272,
        groups => ['ring-users'],
    }

##### END suretec #####

##### BEGIN cloudnl #####

    @add_user { 'cloudnl':
        email => 'support@cloud.nl',
        company => 'Cloud.nl',
        uid => 5273,
        groups => ['ring-users'],
    }

##### END cloudnl #####

##### BEGIN dacor #####

    @add_user { 'dacor':
        email => 'noc@dacor.de',
        company => 'dacor',
        uid => 5274,
        groups => ['ring-users'],
    }

##### END dacor #####

##### BEGIN networkoperations #####

    @add_user { 'networkoperations':
        email => 'noc@networkoperations.nl',
        company => 'Networkoperations',
        uid => 5275,
        groups => ['ring-users'],
    }

##### END networkoperations #####

##### BEGIN blizoo #####

    @add_user { 'blizoo':
        email => 'noc@blizoo.bg',
        company => 'Blizoo Media and Broadband',
        uid => 5276,
        groups => ['ring-users'],
    }

##### END blizoo #####

##### BEGIN vibe #####

    @add_user { 'vibe':
        email => 'noc@vibecommunications.co.nz',
        company => 'Vibe Communications LTD',
        uid => 5277,
        groups => ['ring-users'],
    }

##### END vibe #####

##### BEGIN atw #####

    @add_user { 'atw':
        email => 'noc@atw.co.hu',
        company => 'ATW Internet Kft.',
        uid => 5278,
        groups => ['ring-users'],
    }

##### END atw #####

##### BEGIN onlinesas #####

    @add_user { 'onlinesas':
        email => 'noc@as12876.net',
        company => 'Online S.A.S.',
        uid => 5279,
        groups => ['ring-users'],
    }

##### END onlinesas #####

##### BEGIN mainloop #####

    @add_user { 'mainloop':
        email => 'support@mainstreamhosting.se',
        company => 'Mainloop Solutions AB',
        uid => 5280,
        groups => ['ring-users'],
    }

##### END mainloop #####

##### BEGIN tigron #####

    @add_user { 'tigron':
        email => 'noc@tigron.net',
        company => 'Tigron bvba',
        uid => 5281,
        groups => ['ring-users'],
    }

##### END tigron #####

##### BEGIN nexiu #####

    @add_user { 'nexiu':
        email => 'noc@nexiu.net',
        company => 'nexiu',
        uid => 5282,
        groups => ['ring-users'],
    }

##### END nexiu #####

##### BEGIN digitalocean #####

    @add_user { 'digitalocean':
        email => 'noc@digitalocean.com',
        company => 'DigitalOcean',
        uid => 5283,
        groups => ['ring-users'],
    }

##### END digitalocean #####

##### BEGIN bdhub #####

    @add_user { 'bdhub':
        email => 'noc@bdhub.com',
        company => 'bdHUB Limited',
        uid => 5284,
        groups => ['ring-users'],
    }

##### END bdhub #####

##### BEGIN blacknight #####

    @add_user { 'blacknight':
        email => 'noc@blacknight.com',
        company => 'Blacknight',
        uid => 5285,
        groups => ['ring-users'],
    }

##### END blacknight #####

##### BEGIN globalways #####

    @add_user { 'globalways':
        email => 'noc@globalways.net',
        company => 'Globalways AG',
        uid => 5286,
        groups => ['ring-users'],
    }

##### END globalways #####

##### BEGIN dfn #####

    @add_user { 'dfn':
        email => 'noc@noc.dfn.de',
        company => 'DFN',
        uid => 5287,
        groups => ['ring-users'],
    }

##### END dfn #####

##### BEGIN liquidweb #####

    @add_user { 'liquidweb':
        email => 'noc@liquidweb.com',
        company => 'Liquid Web',
        uid => 5288,
        groups => ['ring-users'],
    }

##### END liquidweb #####

##### BEGIN riseup #####

    @add_user { 'riseup':
        email => 'root@riseup.net',
        company => 'Riseup Networks',
        uid => 5289,
        groups => ['ring-users'],
    }

##### END riseup #####

##### BEGIN immense #####

    @add_user { 'immense':
        email => 'support@immense.net',
        company => 'Immense Networks, LLC',
        uid => 5290,
        groups => ['ring-users'],
    }

##### END immense #####

##### BEGIN bchnetwork #####

    @add_user { 'bchnetwork':
        email => 'noc@as35701.net',
        company => 'BCH Network',
        uid => 5291,
        groups => ['ring-users'],
    }

##### END bchnetwork #####

##### BEGIN cesnet #####

    @add_user { 'cesnet':
        email => 'noc@cesnet.cz',
        company => 'CESNET',
        uid => 5292,
        groups => ['ring-users'],
    }

##### END cesnet #####

##### BEGIN adix #####

    @add_user { 'adix':
        email => 'noc@adix.nl',
        company => 'Adix BV',
        uid => 5293,
        groups => ['ring-users'],
    }

##### END adix #####

##### BEGIN sasag #####

    @add_user { 'sasag':
        email => 'noc@sasag.ch',
        company => 'sasag Kabelkommunikation AG',
        uid => 5294,
        groups => ['ring-users'],
    }

##### END sasag #####

##### BEGIN ovh #####

    @add_user { 'ovh':
        email => 'noc@ovh.net',
        company => 'OVH',
        uid => 5295,
        groups => ['ring-users'],
    }

##### END ovh #####

##### BEGIN btireland #####

    @add_user { 'btireland':
        email => 'networksirl@bt.com',
        company => 'BT Ireland',
        uid => 5296,
        groups => ['ring-users'],
    }

##### END btireland #####

##### BEGIN larsendata #####

    @add_user { 'larsendata':
        email => 'noc@larsendata.dk',
        company => 'Larsen Data ApS',
        uid => 5297,
        groups => ['ring-users'],
    }

##### END larsendata #####

##### BEGIN firstcolo #####

    @add_user { 'firstcolo':
        email => 'noc@first-colo.net',
        company => 'First Colo GmbH',
        uid => 5298,
        groups => ['ring-users'],
    }

##### END firstcolo #####

##### BEGIN tumuenchen #####

    @add_user { 'tumuenchen':
        email => 'lir-admin@net.in.tum.de',
        company => 'Chair for Network Architectures and Services at the Technische Universitaet Muenchen',
        uid => 5299,
        groups => ['ring-users'],
    }

##### END tumuenchen #####

##### BEGIN kudelski #####

    @add_user { 'kudelski':
        email => 'rndoi-noc@nagra.com',
        company => 'Kudelski Security',
        uid => 5300,
        groups => ['ring-users'],
    }

##### END kudelski #####

##### BEGIN csuc #####

    @add_user { 'csuc':
        email => 'com@csuc.cat',
        company => 'CSUC',
        uid => 5301,
        groups => ['ring-users'],
    }

##### END csuc #####

##### BEGIN qcom #####

    @add_user { 'qcom':
        email => 'staff@qcom.it',
        company => 'Qcom SPA',
        uid => 5302,
        groups => ['ring-users'],
    }

##### END qcom #####

##### BEGIN jointtransit #####

    @add_user { 'jointtransit':
        email => 'noc@jointtransit.nl',
        company => 'Joint Transit',
        uid => 5303,
        groups => ['ring-users'],
    }

##### END jointtransit #####

##### BEGIN edsitech #####

    @add_user { 'edsitech':
        email => 'noc@edsi-tech.com',
        company => 'EDSI-Tech Sarl',
        uid => 5304,
        groups => ['ring-users'],
    }

##### END edsitech #####

##### BEGIN 1oconsulting #####

    @add_user { '1oconsulting':
        email => 'support@1o.se',
        company => '1o Consulting',
        uid => 5305,
        groups => ['ring-users'],
    }

##### END 1oconsulting #####

##### BEGIN datacentred #####

    @add_user { 'datacentred':
        email => 'support@datacentred.co.uk',
        company => 'DataCentred',
        uid => 5306,
        groups => ['ring-users'],
    }

##### END datacentred #####

##### BEGIN vshn #####

    @add_user { 'vshn':
        email => 'tech@vshn.ch',
        company => 'VSHN AG',
        uid => 5308,
        groups => ['ring-users'],
    }

##### END vshn #####

##### BEGIN queryfoundry #####

    @add_user { 'queryfoundry':
        email => 'noc@queryfoundry.com',
        company => 'Query Foundry, LLC',
        uid => 5307,
        groups => ['ring-users'],
    }

##### END queryfoundry #####

##### BEGIN globalconnect #####

    @add_user { 'globalconnect':
        email => 'omc@globalconnect.dk',
        company => 'GlobalConnect A/S',
        uid => 5309,
        groups => ['ring-users'],
    }

##### END globalconnect #####

##### BEGIN openit #####

    @add_user { 'openit':
        email => 'noc@openit.de',
        company => 'OpenIT GmbH',
        uid => 5310,
        groups => ['ring-users'],
    }

##### END openit #####

##### BEGIN fidonet #####

    @add_user { 'fidonet':
        email => 'ops@fido.net',
        company => 'FidoNet',
        uid => 5311,
        groups => ['ring-users'],
    }

##### END fidonet #####

##### BEGIN atechmedia #####

    @add_user { 'atechmedia':
        email => 'support@atechmedia.com',
        company => 'aTech Media',
        uid => 5312,
        groups => ['ring-users'],
    }

##### END atechmedia #####

##### BEGIN cablecom #####

    @add_user { 'cablecom':
        email => 'noc@cablecomnetworking.co.uk',
        company => 'Cablecom Networking Ltd',
        uid => 5313,
        groups => ['ring-users'],
    }

##### END cablecom #####

##### BEGIN netnod #####

    @add_user { 'netnod':
        email => 'noc@netnod.se',
        company => 'Netnod',
        uid => 5314,
        groups => ['ring-users'],
    }

##### END netnod #####

##### BEGIN quadranet #####

    @add_user { 'quadranet':
        email => 'escalations@quadranet.com',
        company => 'QuadraNet, Inc',
        uid => 5315,
        groups => ['ring-users'],
    }

##### END quadranet #####

##### BEGIN xfernet #####

    @add_user { 'xfernet':
        email => 'netops@xfernet.net',
        company => 'Xfernet',
        uid => 5316,
        groups => ['ring-users'],
    }

##### END xfernet #####

##### BEGIN speakup #####

    @add_user { 'speakup':
        email => 'noc@speakup.nl',
        company => 'SpeakUp',
        uid => 5317,
        groups => ['ring-users'],
    }

##### END speakup #####

##### BEGIN dna #####

    @add_user { 'dna':
        email => 'noc@dnaip.fi',
        company => 'DNA OY',
        uid => 5318,
        groups => ['ring-users'],
    }

##### END dna #####

##### BEGIN tdc #####

    @add_user { 'tdc':
        email => 'staff@eng.tdc.net',
        company => 'TDC A/S',
        uid => 5319,
        groups => ['ring-users'],
    }

##### END tdc #####

##### BEGIN nicbr #####

    @add_user { 'nicbr':
        email => 'operador@registro.nic.br',
        company => 'Nucelo de Informacao e Coordenacao do Ponto BR',
        uid => 5320,
        groups => ['ring-users'],
    }

##### END nicbr #####

##### BEGIN exnetworks #####

    @add_user { 'exnetworks':
        email => 'noc@exn.co.uk',
        company => 'EX Networks',
        uid => 5321,
        groups => ['ring-users'],
    }

##### END exnetworks #####

##### BEGIN sggs #####

    @add_user { 'sggs':
        email => 'noc@sg.gs',
        company => 'SG.GS',
        uid => 5322,
        groups => ['ring-users'],
    }

##### END sggs #####

##### BEGIN peakten #####

    @add_user { 'peakten':
        email => 'networkengineering@peak10.com',
        company => 'Peak 10',
        uid => 5323,
        groups => ['ring-users'],
    }

##### END peakten #####

##### BEGIN nianet #####

    @add_user { 'nianet':
        email => '3level@nianet.dk',
        company => 'Nianet A/S',
        uid => 5324,
        groups => ['ring-users'],
    }

##### END nianet #####

##### BEGIN pix #####

    @add_user { 'pix':
        email => 'smansour@palestineix.com',
        company => 'Palestine Internet Exchange Point - PIX',
        uid => 5325,
        groups => ['ring-users'],
    }

##### END pix #####

##### BEGIN utwente #####

    @add_user { 'utwente':
        email => 'netwerk@utwente.nl',
        company => 'University of Twente',
        uid => 5326,
        groups => ['ring-users'],
    }

##### END utwente #####

##### BEGIN transtelco #####

    @add_user { 'transtelco':
        email => 'noc@transtelco.net',
        company => 'Transtelco',
        uid => 5327,
        groups => ['ring-users'],
    }

##### END transtelco #####

##### BEGIN lwlcom #####

    @add_user { 'lwlcom':
        email => 'noc@lwlcom.com',
        company => 'LWLcom GmbH',
        uid => 5328,
        groups => ['ring-users'],
    }

##### END lwlcom #####

##### BEGIN centarra #####

    @add_user { 'centarra':
        email => 'noc@centarra.com',
        company => 'Centarra Networks',
        uid => 5329,
        groups => ['ring-users'],
    }

##### END centarra #####

##### BEGIN ucsc #####

    @add_user { 'ucsc':
        email => 'noc@ucsc.edu',
        company => 'University of California, Santa Cruz',
        uid => 5330,
        groups => ['ring-users'],
    }

##### END ucsc #####

##### BEGIN nordunet #####

    @add_user { 'nordunet':
        email => 'ip@nordu.net',
        company => 'NORDUnet A/S',
        uid => 5331,
        groups => ['ring-users'],
    }

##### END nordunet #####

##### BEGIN bkkfiber #####

    @add_user { 'bkkfiber':
        email => 'noc@bkk.no',
        company => 'BKK Fiber AS',
        uid => 5332,
        groups => ['ring-users'],
    }

##### END bkkfiber #####

##### BEGIN cloudcenter #####

    @add_user { 'cloudcenter':
        email => 'noc@cloudcenter.fi',
        company => 'Cloud Center Finland Oy',
        uid => 5333,
        groups => ['ring-users'],
    }

##### END cloudcenter #####

##### BEGIN worldstream #####

    @add_user { 'worldstream':
        email => 'noc@worldstream.nl',
        company => 'WorldStream B.V.',
        uid => 5334,
        groups => ['ring-users'],
    }

##### END worldstream #####

##### BEGIN cloudvps #####

    @add_user { 'cloudvps':
        email => 'noc@cloudvps.com',
        company => 'CloudVPS',
        uid => 5335,
        groups => ['ring-users'],
    }

##### END cloudvps #####

##### BEGIN veracity #####

    @add_user { 'veracity':
        email => 'nocgroup@veracitynetworks.com',
        company => 'Veracity Networks',
        uid => 5336,
        groups => ['ring-users'],
    }

##### END veracity #####

##### BEGIN vellance #####

    @add_user { 'vellance':
        email => 'noc@ppse.net',
        company => 'Vellance',
        uid => 5337,
        groups => ['ring-users'],
    }

##### END vellance #####

}
