#/bin/bash

nodeType=$1;
pathLog="";

case "$nodeType" in
apache* ) pathLog="/var/log/httpd";;
"maven" ) pathLog="/var/log/maven/";;
"memcached" ) pathLog="/var/log/memcached";;
nginx* ) pathLog="/var/log/nginx";;
"varnish" ) pathLog="/var/log/varnish";;
tomcat* ) pathLog="/opt/tomcat/logs";;
esac

[[ -z ${pathLog} ]] && pathLog="/var/log"

[[ -d "/var/log/bitninja" && ! -d "${pathLog}/bitninja" ]] && ln -s /var/log/bitninja ${pathLog}
[[ -d "/var/log/bitninja-ssl-termination" && ! -d "${pathLog}/bitninja-ssl-termination" ]] && ln -s /var/log/bitninja-ssl-termination ${pathLog}
exit 0;
