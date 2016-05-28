#!/bin/bash

apt-get -qqy update

apt-get -qqy install apt-transport-https ca-certificates
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
if [ ! -f /etc/apt/sources.list.d/docker.list ] ; then
 echo "deb https://apt.dockerproject.org/repo debian-$(lsb_release  -cs) main" >> /etc/apt/sources.list.d/docker.list
 apt-get -qqy update
fi

dpkg -l docker-engine || apt-get -qqy install docker-engine


if [ ! -f /etc/systemd/system/docker.service.d/http-proxy.conf ] ; then
 [ -d /etc/systemd/system/docker.service.d ] || mkdir /etc/systemd/system/docker.service.d
 cat <<EOF > /etc/systemd/system/docker.service.d/http-proxy.conf
Environment="HTTP_PROXY=http://localhost:8888/" "NO_PROXY=localhost,127.0.0.1"
EOF
 systemctl daemon-reload
fi
