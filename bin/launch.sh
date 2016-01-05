#!/bin/bash
test -d $1 || exit 1
test -z $2 && exit 1
heat template-validate -f $1/heat.yml -e $1/heat-parameters.yml && \
heat stack-create $2 -f $1/heat.yml -e $1/heat-parameters.yml
