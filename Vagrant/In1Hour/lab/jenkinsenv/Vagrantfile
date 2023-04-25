# -*- mode: ruby -*-
# vi: set ft=ruby :

#Place Vagrantfile in the directory you run vagrant from.
#This should also contain ubuntu.yml which configure VMs

# setting for all VMs
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.provision "ansible_local", playbook: "ubuntu.yml"
  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 2
  #config.vm.network "forwarded_port", guest: 8080, host:8080
 # config.vm.provision "shell" do |shell|
 #   shell.path = "jenkins.sh"
 # end
end

  # specific for jenkins
  config.vm.define "jenkins" do |jenkins|
    jenkins.vm.hostname = "jenkins"
    jenkins.vm.network "private_network", ip: "192.168.56.101"
    jenkins.vm.network "forwarded_port", guest: 8080, host:8080
    jenkins.vm.provision "shell" do |shell|
      shell.path = "jenkins.sh"
  end
end

  # specific for ubuntu2
  config.vm.define "ubuntu2" do |ubuntu2|
    ubuntu2.vm.hostname = "ubuntu2"
    ubuntu2.vm.network "private_network", ip: "192.168.56.102"
  end
end