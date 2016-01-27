#!/bin/bash
set -x

su - stackato -c '/home/stackato/bin/kato role remove mdns' 
su - stackato -c '/home/stackato/bin/kato node rename $public_ip.xip.io'
