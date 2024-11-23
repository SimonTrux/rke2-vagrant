# vi: set ft=ruby :

machines = [
  { :hostname => "cp1", :ram => 4096, :cpu => 4 },
  { :hostname => "node2", :ram => 4096, :cpu => 2 },
  { :hostname => "node3", :ram => 4096, :cpu => 2 },
# { :hostname => "node4", :ram => 4096, :cpu => 4, :ip => "192.168.100.10", :box => "hashicorp/bionic64" },
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
#       ansible.limit = "all"
        ansible.playbook = "ansible/dummy.yml"
        ansible.groups = {
          "cp" => ["cp1"],
          "nodes" => ["node2", "node3"],
        }
      end
end

