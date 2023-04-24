# DevOps Tools for Beginners: Vagrant in 1 hour

> `https://www.udemy.com/course/vagrant-for-beginners-tools-to-start-your-devops-career`

## Introduction

- [Vagrant site](https://www.vagrantup.com/)
- [Virtual box][https://www.virtualbox.org/]

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
vagrant box list
vagrant box outdated
vagrant box update
vagrant status
vagrant global-status
vagrant reload

```

