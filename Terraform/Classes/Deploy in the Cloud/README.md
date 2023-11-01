# Deploy Infra in the Cloud using Terraform

## About

> `https://www.udemy.com/course/deploy-infra-in-the-cloud-using-terraform`

Learn how to apply Infrastructure as Code (IaC) with Terraform. Covers Web Apps, Database, VM, Kubernetes and Azure.

## Section 1: Introduction

- [Github](https://github.com/HoussemDellai/terraform-course)

```sh
git clone https://github.com/HoussemDellai/terraform-course.git ./resources/terraform-course.github
```

Connect with the author
You can connect with the author Houssem Dellai on:

- [Linkedin](https://www.linkedin.com/in/houssemdellai/)
- [Twitter](https://twitter.com/houssemdellai/)
- [Youtube channel](https://www.youtube.com/houssemdellai/)
- [Github repository](https://github.com/HoussemDellai/)

## Section 2: Terraform basics

- [Overview](./resources/Terraform_007_Terraform.pdf)

```sh
terraform init

terraform plan

terraform apply

terraform validate

terraform fmt
```

1. Question 1:

What is the Terraform command to preview the infra changes before deploying them ?

- $ terraform init
- $ terraform plan -out tfplan **<<<===**
- $ terraform apply tfplan

2. Question 2:

What is the Terraform command to format a document to the standard style ?

- $ terraform format
- $ terraform fmt **<<<===**
- $ terraform validate

3. Question 3

What is the Terraform command to deploy infrastructure to the target system ?

- $ terraform apply **<<<===**
- $ terraform plan
- $ terraform init

## Section 3: Input & output variables
