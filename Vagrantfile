# -*- mode: ruby -*-
# vi: set ft=ruby :

machines=[
  {
    :hostname => "cp1",
    :ram => 4096,
    :cpu => 4,
#   :ip => "192.168.100.10",
#   :box => "hashicorp/bionic64",
  },
  {
    :hostname => "node2",
    :ram => 4096,
    :cpu => 2,
  },
  {
    :hostname => "node3",
    :ram => 4096,
    :cpu => 2,
  }
]


Vagrant.configure(2) do |config|
    machines.each do |machine|
        config.vm.define machine[:hostname] do |node|
            node.vm.box = "almalinux/9"
            node.vm.box_version = "9.4.20240805"
            node.vm.hostname = machine[:hostname]
#           node.vm.network "private_network", ip: machine[:ip]
            node.vm.provider "libvirt" do |lv|
                lv.memory = machine[:ram]
                lv.cpus = machine[:cpu]
            end
        end
    end


    config.vm.provision :ansible do |ansible|
      ansible.limit = "all"
      ansible.playbook = "ansible/play.yml"
      ansible.groups = {
        "cp" => ["cp1"],
        "nodes" => ["node2", "node3"],
       #"nodes:vars" => {"INSTALL_RKE2_TYPE" => "agent",
       #                   "test_var" => "test_var_is_agent"}
       #"cp:vars" => {"INSTALL_RKE2_TYPE" => "server",
       #                   "test_var" => "test_var_is_cp"},
      }
    end

end

#Vagrant.configure("2") do |config|
#
#  config.vm.box = "almalinux/9"
#  config.vm.box_version = "9.4.20240805"
#
#  config.vm.provider "libvirt" do |lv|
#    lv.memory = 4096
#    lv.cpus = 2
#
#
#  end
#
## config.vm.define "cp1" do |node|
##   node.vm.hostname = "cp"
## end
#
#  N = 3
#  (1..N).each do |id|
#
#    if id == 1
#      hostname = "cp1"
#    else
#      hostname = "node#{id}"
#
#    config.vm.define "#{hostname}" do |node|
#      node.vm.hostname = "#{hostname}"
#
#    if id == N
#      node.vm.provision :ansible do |ansible|
#        ansible.limit = "all"
#        ansible.playbook = "ansible/play.yml"
#        ansible.groups = {
#          "cp" => ["cp1"],
#          "cp:vars" => {"INSTALL_RKE2_TYPE" => "server",
#                             "test_var" => "test_var_is_cp"},
#          "nodes" => ["node2", "node3"],
#          "nodes:vars" => {"INSTALL_RKE2_TYPE" => "agent",
#                             "test_var" => "test_var_is_agent"}
#}
#      end
#    end
#    end
#    end
#  end
#
#
#       #  "nodes:vars" => {"ntp_server" => "ntp.atlanta.example.com",
#       #                     "proxy" => "proxy.atlanta.example.com"}
#
#  # Enable provisioning with a shell script. Additional provisioners such as
#  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
#  # documentation for more information about their specific syntax and use.
#  # config.vm.provision "shell", inline: <<-SHELL
#  #   apt-get update
#  #   apt-get install -y apache2
#  # SHELL
#  #
## examples from former Vagrantfile
##  config.vm.provision "shell", name: "disable-swap", path: "disable-swap.sh", privileged: false
##  config.vm.provision "shell", name: "install-essential-tools", path: "install-essential-tools.sh", privileged: false
##  config.vm.provision "shell", name: "allow-bridge-nf-traffic", path: "allow-bridge-nf-traffic.sh", privileged: false
##  config.vm.provision "shell", name: "install-containerd", path: "install-containerd.sh", privileged: false
##  config.vm.provision "shell", name: "install-kubeadm", path: "install-kubeadm.sh", privileged: false
##  config.vm.provision "shell", name: "update-kubelet-config", path: "update-kubelet-config.sh", args: ["eth1"], privileged: false
#end
