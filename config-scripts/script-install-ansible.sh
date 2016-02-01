#!/bin/bash
set -x
#
# parametres = env variable
#

export DEBIAN_FRONTEND=noninteractive
apt-get -qqy update
apt-get -qqy upgrade
apt-get -f -y -q install ansible git

