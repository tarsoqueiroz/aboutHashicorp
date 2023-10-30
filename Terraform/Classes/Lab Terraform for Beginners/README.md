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

I'm here!!!

## Lab: Resource Dependencies

## Lab: Output Variables

## Lab: terraform State

## Lab: Terraform Commands

## Lab: Lifecycle Rules

## Lab: Datasources

## Lab: Count and for each

## Lab: Version Constraints

