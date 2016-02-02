#!/bin/bash

export PATH=/usr/local/bin:$PATH
ansible-playbook -i /root/ansible/hosts /root/ansible/local.yaml -e @/root/ansible/vars.yaml -vv

