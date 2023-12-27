# Vagrant Mastery

## About

From NGINX Mastery, it's a parte focused on Vagrant.

> `https://www.udemy.com/course/setup-and-configure-windows-nano-server-2016-from-scratch`

## Installing

- [VirtualBox](https://www.virtualbox.org/)
- [Vagrant](https://www.vagrantup.com/)
- [Install Vagrant](https://developer.hashicorp.com/vagrant/docs/installation)

## Single VM

```sh
cd SingleVM

mkdir SingleVM
cd SingleVM/

vagrant init hashicorp/precise64 https://vagrantcloud.com/hashicorp/precise64

cd ..
cd Centos/

vagrant init centos/7

vagrant box list

vagrant up
vagrant status
vagrant ssh
vagrant destroy -f

```
