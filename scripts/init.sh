#!/bin/bash
#
#       /etc/rc.d/init.d/bitninja
#
#       Jelastic control script
#       Start/Stop script
#
### BEGIN INIT INFO
# Provides: $jelastic
# Required-Start: $local_fs $network $iptables
# Should-Start: $netconsole apache2 nginx lighttpd mysql
# Required-Stop:
# Default-Start:  2 3 4 5
# Default-Stop: 0 1 6
# Short-Description: Jelastic BitNinja scale and clone control script.
# Description: Control script to manage node actions behaviour - scaling and clone.
### END INIT INFO

JELASTIC_ACTION="/etc/bitninja/jelastic_action"
ACTION=$(cat $JELASTIC_ACTION)

function cleanBitNinjaAgent() {
  service bitninja stop; yum -y remove 'bitninja*'; rm -Rf /opt/bitninja*; rm -Rf /var/lib/bitninja*; rm -Rf /etc/bitninja*;
  rm -Rf /var/log/bitninja*;
}

[[ $ACTION == "clone" || $ACTION == "scale" ]] && { cleanBitNinjaAgent; exit 0; } #relates to onBeforeClone and onBeforeServiceScaleOut events only

echo "" > $JELASTIC_ACTION

/etc/init.d/bitninja $@
