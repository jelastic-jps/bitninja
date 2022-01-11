#/bin/bash

nodeType=$1;
pathLog="";

case "$nodeType" in
nginx* ) pathLog="/var/log/nginx";;
varnish* ) pathLog="/var/log/varnish";;
apache* ) pathLog="/var/log/httpd";;
tomcat* ) pathLog="/opt/tomcat/logs";;
tomee* ) pathLog="/opt/tomcat/logs";;
jetty* ) pathLog="/opt/jetty/logs";;
glassfish3* ) pathLog="/opt/glassfish3/glassfish/domains/domain1/logs";;
nodejs* ) pathLog="/opt/nodejs/logs";;
springboot* ) pathLog="/var/log/springboot";;
mysql* ) pathLog="/var/log/mysql";;
mariadb* ) pathLog="/var/log/mysql";;
"postgresql" ) pathLog="/var/log/";;
postgres* ) pathLog="/var/lib/pgsql/data/pg_log";;
"memcached" ) pathLog="/var/log/memcached";;
"maven" ) pathLog="/var/log/maven/";;
esac

[[ -z ${pathLog} ]] && pathLog="/var/log"

[[ -d "/var/log/bitninja" && ! -d "${pathLog}/bitninja" ]] && ln -s /var/log/bitninja ${pathLog}
[[ -d "/var/log/bitninja-ssl-termination" && ! -d "${pathLog}/bitninja-ssl-termination" ]] && ln -s /var/log/bitninja-ssl-termination ${pathLog}
exit 0;
