# Lab – Terraform for Beginners

## About

> `https://kodekloud.com/courses/lab-terraform-for-beginners`

In this course, we will get started with Terraform, but first we will take a look at Infrastructure as a code Or IaC and the different types of tools available in IaC and their purpose in managing modern IT Infrastructure. We’ll then see the role of terraform in the today’s IT Infrastructure. We’ll then learn how to install Terraform, This is followed by the basics of Hashicorp Configuration Language (HCL). Next we have our first lab where you’ll get your hands dirty with HCL syntax. We will then learn the basics of Terraform such as Providers, Input and Output variables, Resource Attributes and Dependencies.

After this we take a look at state in terraform – what it is, why it is used and considerations to follow when working with state. We then dig deeper in to the fundamentals– starting with the different commands provided by Terraform. This is followed by a lecture where we understand the difference between Mutable and Immutable infrastructure. This is followed by lifecycle rules in terraform where we will learn how to manage the ways in which resources are created. This is followed by other basic topics such as datasources, meta arguments such as count and for each and finally understand version constraints in Terraform.

What are the pre-requisites to attend this course?

- There are no pre-requisites to attend this course
- The Devops pre-requisites course is an added advantage
- We will cover the basics of AWS with demos as part of this course

## Lab: HCL Basics

Lab with simple local file provider building a simple file.

## Lab: Terraform Providers

What's difference between oficial and partner provider plugin?

## Lab: Multiple Providers

- task5: `pet-name.tf`

```json
resource "local_file" "my-pet" {
  filename = "/root/pet-name"
  content = "My pet is called finnegan!"
}

resource "random_pet" "other-pet" {
  length = "1"
  prefix = "Mr"
  separator = "."
}
```

## Lab: Variables

- `variables.tf`

```json
variable "name" {
     type = string
     default = "Mark"
}
variable "number" {
     type = bool
     default = true
}
variable "distance" {
     type = number
     default = 5
}
variable "jedi" {
     type = map
     default = {
     filename = "/root/first-jedi"
     content = "phanius"
     }
}
variable "gender" {
     type = list(string)
     default = ["Male", "Female"]
}
variable "hard_drive" {
     type = map
     default = {
          slow = "HHD"
          fast = "SSD"
     }
}
variable "users" {
     type = set(string)
     default = ["tom", "jerry", "pluto", "daffy", "donald", "jerry", "chip", "dale"]
}
  
resource "local_file" "jedi2" {
     filename = var.jedi["filename"]
     content = var.jedi["content"]
}
```

## Lab: Using Variables in terraform

- `main.tf`

```json
resource local_file games {
  filename = var.filename
  content = "football"
}
```

- `basket.auto.tfvars`

```json
filename = "/root/basketball.txt"
```

- `terraform.tfvars`

```json
filename = "/root/football.txt"
```

- `throw.auto.tfvars`

```json
filename = "/root/baseball.txt"
```

- `variables.tf`

```json
variable filename {
  type = string
}
```

## Lab: Resource Attributes

- `main.tf`

```json
 resource "time_static" "time_update" {
}

resource local_file time {
  filename = "/root/time.txt"
  content = "Time stamp of this file is ${time_static.time_update.id}"
}
```

## Lab: Resource Dependencies

- `key.tf`

```json
resource "tls_private_key" "pvtkey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "key_details" {
  content  = tls_private_key.pvtkey.private_key_pem
  filename = "/root/key.txt"
}
```

You can read the documentation for more details:

> `https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key`

- `main.tf`

```json
resource "local_file" "whale" {
  filename   = "/root/whale"
  content    = "whale"
  depends_on = [local_file.krill]
}
resource "local_file" "krill" {
  filename = "/root/krill"
  content  = "krill"
}
```

## Lab: Output Variables

- `main.tf` @data

```json
resource "random_uuid" "id1" {
   
}
resource "random_uuid" "id2" {
   
}
resource "random_uuid" "id3" {
   
}
resource "random_uuid" "id4" {
   
}
resource "random_uuid" "id5" {
   
}
resource "random_uuid" "id6" {
   
}
resource "random_uuid" "id7" {
   
}
resource "random_integer" "order1" {
  min     = 1
  max     = 99999
 
}
resource "random_integer" "order2" {
  min     = 1
  max     = 222222
 
}
```

- `output.tf` @data

```json
output "id1" {
   value = random_uuid.id1.result
}
output "id2" {
    value = random_uuid.id2.result
   
}
output "id3" {
    value = random_uuid.id3.result
   
}

output "id4" {
    value = random_uuid.id4.result
   
}
output "id5" {
    value = random_uuid.id5.result
}
   
output "id6" {
    value = random_uuid.id6.result
   
}
output "id7" {
    value = random_uuid.id7.result
   
}
output "order1" {
 value = random_integer.order1.result
 
}
output "order2" {
 value = random_integer.order1.result
 
}
```

- `main.tf` @output

```json
resource "random_pet" "my-pet" {
  length = var.length
}

output "pet-name" {
  value       = random_pet.my-pet.id
  description = "Record the value of pet ID generated by the random_pet resource"
}

resource "local_file" "welcome" {
  filename = "/root/message.txt"
  content  = "Welcome to Kodekloud."
}
output "welcome_message" {
  value = local_file.welcome.content
}
```

- `variable.tf` @output

```json
variable "prefix" {
  default = "Mrs"
}

variable "separator" {
  default = "."
}

variable "length" {
  default = "1"
}
```

## Lab: terraform State

- `main.tf`

```json
resource "local_file" "speed_force" {
    filename = "/root/speed-force"
    content = "speed-force"
}
```

- `reverse-flash.tf`

```json
resource "local_file" "reverse-flash" {
    filename = "/root/reverse-flash"
    content = "reverse-flash"
}
```

- `riddler.tf`

```json
resource "local_file" "riddler" {
    filename = "/root/riddler"
    content = "riddler"
}
```

- `zoom.tf`

```json
resource "local_file" "zoom" {
    filename = "/root/zoom"
    content = "zoom"
}
```

- `provider.tf`

```json
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.13.1"
    }
  }
}

provider "aws" {
  region                      = "us-east-1"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  s3_use_path_style = true
  endpoints {
    ec2 = "http://aws:4566"
    iam = "http://aws:4566"
    s3 = "http://aws:4566"
    dynamodb = "http://aws:4566"
  }
}
```

- `aws-infra.tf`

```json
resource "aws_instance" "dev-server" {
    instance_type = "t2.micro"
    ami         = "ami-02cff456777cd"
}
resource "aws_s3_bucket" "falshpoint"  {
    bucket = "project-flashpoint-paradox"
}
```

## Lab: Terraform Commands

- `main.tf` @project-shazam

```json
resource "local_file" "key_data" {
  filename        = "/tmp/.pki/private_key.pem"
  content         = tls_private_key.private_key.private_key_pem
  file_permission = "0400"
}
resource "tls_private_key" "private_key" {
  algorithm   = "RSA"
  rsa_bits    = 2048
  ecdsa_curve = "P384"
}
resource "tls_cert_request" "csr" {
  private_key_pem = file("/tmp/.pki/private_key.pem")
  depends_on      = [local_file.key_data]

  subject {
    common_name  = "flexit.com"
    organization = "FlexIT Consulting Services"
  }
}
```

- `data.tf`

```json
resource "local_file" "data" {
  filename = "/opt/codes"
  content = "You've to write this code."
}
```

Reference link:

> `https://www.terraform.io/docs/configuration/provider-requirements.html#about-providers`

- `project.tf` @provider

```json
resource "local_file" "cloud" {
  filename = "/tmp/plugins"
  content = "multiple cloud providers."

}	  filename = "/opt/codes"
	  content = "You've to write this code."


resource "aws_ebs_volume" "myvolume" {
  availability_zone = "us-east-2"
  size              = 20
}
```

- `provider.tf` @provider

```json
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.15.0"
    }
  }
}

provider "aws" {
  region                      = lookup(var.region, terraform.workspace)
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  s3_use_path_style = true
  endpoints {
    ec2 = "http://aws:4566"
    dynamodb = "http://aws:4566"
    s3 = "http://aws:4566"
  }
}
```

## Lab: Lifecycle Rules

- `main.tf`

```json
resource "local_file" "file" {
  filename        = var.filename
  file_permission = var.permission
  // content         = random_string.string.id
  content = "This is a random string - ${random_string.string.id}"
  lifecycle {
    create_before_destroy =  true
  }
}

resource "random_string" "string" {
  length = var.length
  keepers = {
    length = var.length
  }
  lifecycle {
    create_before_destroy = true
  }
}
```

- `variables.tf`

```json
variable "length" {
  default = 12
}
variable "filename" {
  default = "/root/random_text"
}
variable "content" {
  default = "This file contains a single line of data"
}
variable "permission" {
  default = 0770
}
```

- `main.tf` v2

```json
resource "random_pet" "super_pet" {
  length = var.length
  prefix = var.prefix
  lifecycle {
    prevent_destroy = true
  }
}
```

## Lab: Datasources

- `main.tf`

```json
output "os-version" {
  value = data.local_file.os.content
}
data "local_file" "os" {
  filename = "/etc/os-release"
}
```

- `ebs.tf`

```json
data "aws_ebs_volume" "gp2_volume" {
  most_recent = true

  filter {
    name   = "volume-type"
    values = ["gp2"]
  }
}
```

- `s3.tf`

```json
data "aws_s3_bucket" "selected" {
  // bucket_name = "bucket.test.com"
  bucket = "bucket.test.com"
}
```

## Lab: Count and for each

- `main.tf`

```json
resource "local_sensitive_file" "name" {
  // filename = "/root/user-data"
  // content  = "password: S3cr3tP@ssw0rd"
  // count    = 3

  // filename = var.users[count.index]
  // content  = var.content
  // count    = length(var.users)

  filename = each.value
  for_each = toset(var.users)
  content  = var.content
}
```

- `variables.tf`

```json
variable "users" {
  // type = list(any)
  type = list(string)
  default = [ "/root/user10", "/root/user11", "/root/user12", "/root/user10"]
}
variable "content" {
  default = "password: S3cr3tP@ssw0rd"
}
```

## Lab: Version Constraints

- `main.tf` @omega

```json
terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "1.2.2"
    }
  }
}

resource "local_file" "innovation" {
  filename = var.path
  content  = var.message
}
```

- `variables.tf` @omega

```json
variable "path" {
  default = "/root/session"
}

variable "message" {
  default = "It's time for innovative ideas.\n"
}
```

- `rotation.tf` @rotate

```json
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "> 3.45.0, !=3.46.0, < 3.48.0"
    }
  }
}

resource "google_compute_instance" "special" {
  name         = "aone"
  machine_type = "e2-micro"
  zone         = "us-west1-c"
}
```

- `nautilus.tf` @nautilus

```json
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ""
    }
  }
}

resource "aws_ebs_volume" "soft-volume" {
  availability_zone = "us-west-2a"
  size              = 15
  tags = {
    Name = "temporary"
  }
}
```

- `tecton.tf` @lexicorp

```json
terraform {
  required_providers {
    k8s = {
      source  = "hashicorp/kubernetes"
      version = "> 1.12.0, != 1.13.1, < 1.13.3 "
    }

    helm = {
      source  = "hashicorp/helm"
      version = "~> 1.2.0"
    }
  }
}
```
