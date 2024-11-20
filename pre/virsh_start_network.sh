#!/bin/bash

set -x
sudo virsh net-start --network default
# If no default, then
#sudo virsh net-define kube-net.xml
#sudo virsh net-start kube-net
#sudo virsh net-autostart kube-net
