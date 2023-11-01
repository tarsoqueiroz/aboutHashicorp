# Terraform Tutorial for Beginners + Labs: Complete Step by Step Guide!

## About

> `https://www.youtube.com/watch?v=YcJ9IeukJL8`

Access the labs here: 

- `https://bit.ly/YT_Terraform`
- `https://kodekloud.com/courses/lab-terraform-for-beginners/`

## Start (0:00:00)

## Course Introduction (0:00:58)

## Accessing the labs (0:02:33)

## Traditional IT and Challenges (0:03:04)

## What is Infrastructure as Code? (0:08:53)

## What is Terraform? (0:14:48)

Install by downloading from `Hashicorp.io`.

## What is HCL - Hashicorp Configuration Language? (0:22:47)

## Lab 1 - HCL Basics (0:33:00)

> `https://kodekloud.com/topic/lab-hcl-basics-2/`

Lab with simple local file provider building a simple file.

## Tour of free Terraform Labs at KodeKloud (0:33:10)

## Update and Destroy Infrastructure in Terraform (0:38:00)

## Lab 2 - Update and Destroy Infrastructure in Terraform (0:40:20)

## Using Using Terraform Providers in Terraform (0:40:28)

| File Name | Purpose |
| :-------: | :------ |
| main.tf | Main configuration file containing resource definition |
| variables.tf | Contains variable declarations |
| outputs.tf | Contains outputs from resources |
| provider.tf | Contains Provider definition |

## Lab 3 - Update and Destroy Infrastructure in Terraform (0:46:10)

> `https://kodekloud.com/topic/lab-terraform-providers-2/`

What's difference between oficial and partner provider plugin?

## Multiple Providers in Terraform (0:46:13)

## Lab 4 - Multiple Providers in Terraform (0:49:55)

> `https://kodekloud.com/topic/lab-multiple-providers-2/`

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

## Input Variables in Terraform (0:50:04)

- [`main.tf`](./resources/variables/main.tf)
- [`variables.tf`](./resources/variables/variables.tf)

## Lab 5 - Input Variables in Terraform (1:01:17)

> `https://kodekloud.com/topic/lab-variables-2/`

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

## Using Variables in Terraform (1:01:25)

## Lab 6 - Using Variables in Terraform (1:06:15)

> `https://kodekloud.com/topic/lab-using-variables-in-terraform-2/`

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

## Resource Attribute Reference in Terraform (1:06:22)

## Lab 7 - Resource Attribute Reference in Terraform (1:09:50)

> `https://kodekloud.com/topic/lab-resource-attributes-2/`

- `main.tf`

```json
 resource "time_static" "time_update" {
}

resource local_file time {
  filename = "/root/time.txt"
  content = "Time stamp of this file is ${time_static.time_update.id}"
}
```

## Resource Dependencies in Terraform (1:10:01)

## Lab 8 - Resource Dependencies in Terraform (1:12:08)

> `https://kodekloud.com/topic/lab-resource-dependencies-2/`

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

## Output Variables in Terraform (1:12:12)

- [`outputs.tf`](./resources/output/outputs.tf)

## Lab 9 - Output Variables in Terraform (1:14:20)

> `https://kodekloud.com/topic/lab-output-variables-2/`

## Purpose of State in Terraform (1:14:28)

## Lab 10 - Purpose of State in Terraform (1:20:28)

> `https://kodekloud.com/topic/lab-terraform-state-2/`

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

## Terraform State Considerations (1:20:35)

## Terraform Commands (1:23:14)

```sh
terraform validate

terraform fmt

terraform show -json

terraform providers

terraform output

terraform refresh

terraform plan

terraform graph
apt install graphviz -y
terraform graph | dot -Tsvg > graph.svg
```

## Lab 11 - Terraform Commands (1:28:34)

> `https://kodekloud.com/topic/lab-terraform-commands-2/`

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

}

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

## Mutable vs Immutable Infrastructure (1:28:42)

## Lifecycle Rules in Terraform (1:34:38)

## Lab 12 - Lifecycle Rules in Terraform (1:40:15)

> `https://kodekloud.com/topic/lab-lifecycle-rules-2/`

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

## Data Sources in Terraform (1:40:26)

## Lab 13 - Data Sources in Terraform (1:44:44)

> `https://kodekloud.com/topic/lab-datasources-2/`

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

## Meta Arguments in Terraform (1:44:50)

## Use of for_each meta arguments in Terraform (1:46:21)

## Lab 14 - Use of for_each meta arguments in Terraform (1:49:25)

> `https://kodekloud.com/topic/lab-count-and-for-each-2/`

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

## Version Constraints in Terraform (1:49:33)

## DevOps Learning Path in KodeKloud (1:54:42)

> `https://kodekloud.com/topic/lab-version-constraints-2/`

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

## That's all folks
