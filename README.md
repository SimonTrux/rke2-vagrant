
## steps : 

### Vagrant up 3 nodes

See Vagrant file, bootstart machines

#### Additionnal setup on vms

```
# Make a file named /etc/NetworkManager/conf.d/rke2-canal.conf
# with this content
[keyfile]
unmanaged-devices=interface-name:cali*;interface-name:flannel*

# then, if machine running
systemctl reload NetworkManager
```
OK


Rebuild smaller Vagrant images with packer, maybe try with alpine
do some vagrant ansible at start

### Prereqs

Then get the ssh config from vagrant

### additional settings to script

```bash
systemctl enable --now firewalld

firewall-cmd --permanent --add-port=22/tcp
#firewall-cmd --permanent --add-port=80/tcp
#firewall-cmd --permanent --add-port=443/tcp
firewall-cmd --permanent --add-port=2379/tcp
firewall-cmd --permanent --add-port=2380/tcp
firewall-cmd --permanent --add-port=2381/tcp
firewall-cmd --permanent --add-port=4240/tcp
firewall-cmd --permanent --add-port=6443/tcp
firewall-cmd --permanent --add-port=8472/udp
firewall-cmd --permanent --add-port=9345/tcp
firewall-cmd --permanent --add-port=30000-32767/tcp
firewall-cmd --permanent --add-port=30000-32767/udp

systemctl reload firewalld
```

https://docs.rke2.io/install/requirements?cni-rules=Cilium

### oInstall

curl -sfL https://get.rke2.io --output install.sh
chmod +x install.sh
INSTALL_RKE2_CHANNEL=latest ./install.sh

systemctl enable rke2-server.service
systemctl start rke2-server.service
#

### to follow
journalctl -u rke2-server -f




### Operating cluster
On GUEST, check RKE2 version :
/var/lib/rancher/rke2/bin/kubectl version

and get kube config : (change to control-plane IP)
cat /etc/rancher/rke2/rke2.yaml


On HOST, to download the good version of kubectl 
cd ~/.local/bin
curl -LO https://dl.k8s.io/release/v1.30.6/bin/linux/amd64/kubectl
chmod +x kubectl



