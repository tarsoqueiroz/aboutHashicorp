# DevOps Tools for Beginners: Vagrant in 1 hour

> `https://www.udemy.com/course/vagrant-for-beginners-tools-to-start-your-devops-career`

## Introduction

- [Vagrant site](https://www.vagrantup.com/)
- [Virtual box][https://www.virtualbox.org/]

```sh
vagrant --version
```

## Working with single VM

```sh
## Workdir
mkdir lab
cd lab/

## Option 1
mkdir option1
cd option1/
vagrant init hashicorp/precise64 https://vagrantcloud.com/hashicorp/precise64
less Vagrantfile 

## Option 2
cd ..
mkdir option2
cd option2
vagrant box add centos/7

## Commands
vagrant up
vagrant status
vagrant destroy
vagrant status
vagrant up
vagrant ssh

## Inside VBox
hostname
whoami
sudo su
hostname
whoami
exit
hostname
whoami
exit

## Maintenace commands
vagrant box add hashicorp/precise64
vagrant box list
vagrant box outdated
vagrant box update
vagrant box remove hashicorp/precise64
vagrant status
vagrant global-status
vagrant reload
```

## Working with multiple VMs

```sh
## Creating VMs
vagrant up
vagrant status
vagrant ssh srv1
## Inside SRV1
cat /etc/centos-release
ip -br -c a
exit
## On host
vagrant ssh srv2
cat /etc/centos-release
ip -br -c a
exit
```

## Ubuntu Lab

> `https://github.com/vlabs8/vagrant`

```sh

```
