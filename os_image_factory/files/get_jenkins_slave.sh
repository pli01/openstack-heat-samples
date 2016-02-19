#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
apt-get -qqy update && apt-get -qqy upgrade
apt-get -qfy install unzip curl openjdk-7-jre openjdk-7-jdk

cd /root
curl -o /root/swarm-client-2.0-jar-with-dependencies.jar http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/2.0/swarm-client-2.0-jar-with-dependencies.jar
