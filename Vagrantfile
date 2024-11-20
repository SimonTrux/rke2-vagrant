# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "almalinux/9"
  config.vm.box_version = "9.4.20240805"

  config.vm.provider "libvirt" do |lv|
    lv.memory = 4096
    lv.cpus = 2
  end

  config.vm.define "cp1" do |node|
    node.vm.hostname = "cp"
  end

  N=2
  (1..N).each do |i|
    hostname = "node#{'%02d' % i}"
    config.vm.define "#{hostname}" do |node|
      node.vm.hostname = "#{hostname}"
    end
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "ansible.play.yml"
  end



  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
  #
# examples from former Vagrantfile
#  config.vm.provision "shell", name: "disable-swap", path: "disable-swap.sh", privileged: false
#  config.vm.provision "shell", name: "install-essential-tools", path: "install-essential-tools.sh", privileged: false
#  config.vm.provision "shell", name: "allow-bridge-nf-traffic", path: "allow-bridge-nf-traffic.sh", privileged: false
#  config.vm.provision "shell", name: "install-containerd", path: "install-containerd.sh", privileged: false
#  config.vm.provision "shell", name: "install-kubeadm", path: "install-kubeadm.sh", privileged: false
#  config.vm.provision "shell", name: "update-kubelet-config", path: "update-kubelet-config.sh", args: ["eth1"], privileged: false
end
