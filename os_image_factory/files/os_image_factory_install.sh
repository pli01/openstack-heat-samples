#!/bin/bash
set -x

export PATH=/usr/local/bin:$PATH
export DEBIAN_FRONTEND=noninteractive

# durty fix waiting network comming up
while ! curl -q -o /dev/null http://http.debian.net/ ; do sleep 2 ; done

apt-get -qqy update
apt-get -qqy -o Dpkg::Options::="--force-confold" upgrade
apt-get -o Dpkg::Options::="--force-confold" remove python-pip --purge -y
apt-get -o Dpkg::Options::="--force-confold" install aptitude git python-dev python-setuptools -y
apt-get -o Dpkg::Options::="--force-confold" install libffi-dev libssl-dev gcc -y

pip install -U setuptools

for i in 1 2 3 4 5; do easy_install pip && break || sleep 2; done

pip install -U pyopenssl ndg-httpsclient pyasn1
pip install -U pip ansible

test -d /etc/ansible || mkdir /etc/ansible
echo -e "[local]\n127.0.0.1 ansible_connection=local ansible_ssh_user=cloud" > /etc/ansible/hosts

