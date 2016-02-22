#!/bin/bash
#TODO: run as jenkins user in /var/lib/jenkins
cat <<EOF > /root/run.sh
java -jar /root/swarm-client-2.0-jar-with-dependencies.jar -master http://$master_jenkins:8080/ -executors 2 &
EOF

chmod +x /root/run.sh

nohup /root/run.sh
