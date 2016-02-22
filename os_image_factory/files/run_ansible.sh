#!/bin/bash
export PATH=/usr/local/bin:$PATH
/usr/local/bin/ansible-playbook /root/os_image_factory/setup/os_image_factory.playbook.yml -vv 2>&1 |tee /var/log/os_image_factory.setup.log
