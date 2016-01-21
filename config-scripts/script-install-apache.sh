#!/bin/bash
set -x
#
# parametres = env variable
#  $public_ip
#

export DEBIAN_FRONTEND=noninteractive
apt-get -qqy update
apt-get -qqy upgrade
apt-get -f -y -q install apache2

echo "$public_ip -> " > /var/www/html/index.html
echo $(/sbin/ifconfig eth0 | grep 'inet addr' | awk -F: '{ print $2 }' | awk '{ print $1 }') >> /var/www/html/index.html

