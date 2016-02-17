# openstack-heat-samples

##Some simple heat samples
* autoscaling-simple: create a simple autoscaling group of simple server
* instance: simple instance
* instance-boot-volume: boot instance from image on volume
* instance-net: instance in a net
* mini-net: create network, subnet, gateway, instance and security group
* net-only: create network, subnet, gateway
* openvpn: create an openvpn instance (boot on volume) in a private network
* waitcondition: create an instance with waitcondition


##Requirements:
 - openstack cli
 - openstack credentials loaded

##Launch stack
 - edit and source ~/my-credentials.rc
 - edit ${stack}/heat-parameters.yaml
 - launch a stack

```
bash bin/launch.sh multi-net mystack0
```
