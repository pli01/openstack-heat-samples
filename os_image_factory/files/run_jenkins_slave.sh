#!/bin/bash

java -jar swarm-client-2.0-jar-with-dependencies.jar -master http://$master_jenkins:8080/ -executors 2 &
