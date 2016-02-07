#!/bin/bash
set -x

export PATH=/usr/local/bin:$PATH
export DEBIAN_FRONTEND=noninteractive

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

#/usr/local/bin/ansible-playbook /root/os_image_factory/setup/os_image_factory.playbook.yml -vv > /var/log/os_image_factory.setup.log 2>&1
