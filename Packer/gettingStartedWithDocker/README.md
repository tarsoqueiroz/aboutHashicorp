# Getting Started with Docker

## About

HashiCorp Packer automates the creation of any type of machine image, including Docker images. You'll build a Docker image on your local machine without using any paid cloud resources.


## Install Packer

```sh
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install packer
```

## Following tutorial

```shell
packer 
packer version
packer init .
packer fmt .
packer validate .

packer build docker-ubuntu.pkr.hcl 
packer build --var-file=example.pkrvars.hcl docker-ubuntu.pkr.hcl
packer build .
packer build --var docker_image=ubuntu:groovy .
```

