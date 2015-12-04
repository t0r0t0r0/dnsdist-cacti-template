#!/bin/sh
###################################################################
#DNSDIST STATS For CACTI
#
#install(CentOS6):
#cp dnsdist-stats.sh /usr/share/cacti/scripts/
#
#SNMPD OID   : .1.3.6.1.4.1.18689.0.2
#REQUEST OID : .1.3.6.1.4.1.18689.0.2.4.1.2.7.100.110.115.100.105.115.116.1
#
###################################################################

###################################################################
#VALUES
###################################################################
SNMPHOSTNAME=$1
SNMPCOMMUNITY=$2
OID=".1.3.6.1.4.1.18689.0.2.4.1.2.7.100.110.115.100.105.115.116.1"
###################################################################

/usr/bin/snmpwalk -v 2c -Ovq -c ${SNMPCOMMUNITY} ${SNMPHOSTNAME} ${OID} | sed 's/"//g' |sed 's/-/_/g'
