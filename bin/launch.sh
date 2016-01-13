#!/bin/bash

function usage()
{
cat <<EOF
$(basename $0) stack-dir stack-name [ heat-parameters.yaml ] [ env.yaml ]
   stack-dir: directory with heat.yaml
   stack-name: name of the stack to create
   heat-parameters.yaml: [default: stack-dir/heat-parameters.yaml] yaml file with parameters like flavor,image
   env.yaml: [default: stack-dir/env.yml] yaml file with resource_registry mapping (ex: Lib::Stack::Web: web.yaml)

ex: 
  bin/launch.sh instance-boot-volume mystack
  bin/launch.sh instance-boot-volume mystack heat-parameters-mycloud.yaml
  bin/launch.sh instance-boot-volume mystack heat-parameters-mycloud.yaml myenv.yaml

EOF
exit 1
}
test -d $1 || usage
test -z $2 && usage

parameters=$1/${3:-heat-parameters.yaml}
registry=$1/${4:-env.yaml}

registry_opt="-e $registry"
[ -f $registry ] || registry_opt=""

[ -f $parameters ] || exit 1
heat -k template-validate -f $1/heat.yaml $registry_opt -e $parameters && \
heat -k stack-create $2 -f $1/heat.yaml $registry_opt -e $parameters 
