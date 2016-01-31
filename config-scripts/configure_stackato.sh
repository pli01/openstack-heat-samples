#!/bin/bash
set -x

echo 'stackato ALL = (root) NOPASSWD: ALL' | sudo tee /etc/sudoers.d/nopasswd
chmod 0440 /etc/sudoers.d/nopasswd
su - stackato -c '/home/stackato/bin/kato role remove mdns' 
su - stackato -c '/home/stackato/bin/kato node rename $public_ip.xip.io'
