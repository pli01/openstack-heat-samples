#!/bin/bash
set -x
test -d /root/ansible || mkdir /root/ansible
git clone https://github.com/geerlingguy/ansible-role-mysql.git /root/ansible/mysql

