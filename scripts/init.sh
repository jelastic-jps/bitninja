#!/bin/bash
#
#       /etc/rc.d/init.d/bitninja
#
#       BitNinja Server Security
#       Start/Stop script
#
### BEGIN INIT INFO
# Provides: $bitninja
# Required-Start: $local_fs $network $iptables
# Should-Start: $netconsole apache2 nginx lighttpd mysql
# Required-Stop:
# Default-Start:  2 3 4 5
# Default-Stop: 0 1 6
# Short-Description: BitNinja Server Security daemon (BitNinja.IO)
# Description: BitNinja is an easy to install, easy to use integrated
#              server security softwar. It can protect your server against
#              many kind of threats and attacks.
### END INIT INFO

JELASTIC_ACTION="/etc/bitninja/jelastic_action"
ACTION=$(cat $JELASTIC_ACTION)

function cleanBitNinjaAgent() {
  service bitninja stop; yum -y remove 'bitninja*'; rm -Rf /opt/bitninja*; rm -Rf /var/lib/bitninja*; rm -Rf /etc/bitninja*;
  rm -Rf /var/log/bitninja*;
}

[[ $ACTION == "clone" || $ACTION == "scale" ]] && { cleanBitNinjaAgent; exit 0; }

echo "" > $JELASTIC_ACTION

/etc/init.d/bitninja $@
