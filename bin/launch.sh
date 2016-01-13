#!/bin/bash
test -d $1 || exit 1
test -z $2 && exit 1

parameters=$1/${3:-heat-parameters.yaml}
[ -f $parameters ] || exit 1
heat -k template-validate -f $1/heat.yml -e $parameters && \
heat -k stack-create $2 -f $1/heat.yml -e $parameters
