#!/bin/bash

export PATH=/usr/local/bin:$PATH
ansible-playbook -i 'localhost,' -c local /root/ansible/local.yaml -e @/root/ansible/vars.yaml -vv 2>&1 | tee -a /var/log/run_ansible.log

