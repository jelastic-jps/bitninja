#/bin/bash

pathLog=$1;
[[ -z ${pathLog} ]] && pathLog="/var/log"

[[ -d "/var/log/bitninja" && ! -d "${pathLog}/bitninja" ]] && ln -s /var/log/bitninja ${pathLog}
[[ -d "/var/log/bitninja-ssl-termination" && ! -d "${pathLog}/bitninja-ssl-termination" ]] && ln -s /var/log/bitninja-ssl-termination ${pathLog}
exit 0;
