#/bin/bash

nodeType=$1;
pathLog="/var/log/";

case "$1" in
"apache") pathLog="/var/log/httpd";
"maven") pathLog="/var/log/maven/";
"memcached") pathLog="/var/log/memcached";
"nginx") pathLog="/var/log/nginx";
"nginxphp") pathLog="/var/log/nginx";
"varnish") pathLog="/var/log/varnish";

ln -s /var/log/bitninja ${pathLog}
ln -s /var/log/bitninja-ssl-termination ${pathLog}
