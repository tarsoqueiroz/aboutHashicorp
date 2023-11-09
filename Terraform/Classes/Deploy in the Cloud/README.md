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

- [azurerm_app_service](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service)
- [03_Execution_Plan](https://github.com/HoussemDellai/terraform-course/tree/main/03_Execution_Plan)

## Section 4: Terraform execution plan

> `main.tf` ---> `terraform init`
>
> `terraform plan {-out result.tfplan}` ===> `.tfplan`
>
> `terraform show -json result.tfplan | jq .`
>
> `terraform apply result.tfplan` ===> `terraform.tfstate`

## Section 5: Terraform state

When `terraform apply` is under execution the `.tfstate` is locked all over the process.

## Section 6: How Terraform work with plan and state

> [Terraform: How TF works](./resources/Terraform_010_How+TF+works.pdf)

## Section 7: Terraform Workspace

> `https://github.com/HoussemDellai/terraform-course/tree/main/05_Web_Sql_database`

```sh
$ terraform workspace add dev
$ terraform workspace add prod
$ terraform workspace add test

$ terraform workspace list
  default
  dev
* prod
  test

$ terraform workspace select dev
  Switched to workspace "dev"

$ terraform workspace list
  default
* dev
  prod
  test

$ terraform plan -out .\dev\dev.tfplan  \
                 -state .\dev\dev.state \
                 -var-file .\dev\dev.tfvars

$ terraform plan -out .\test\test.tfplan  \
                 -state .\test\test.state \
                 -var-file .\test\test.tfvars
```

## Section 8: Deploy container services

## Section 9: Deploying Azure Container Apps

## Section 10: Deploying PaaS services

## Section 11: Deploying IaaS services

## Section 12: Deploying Logics Apps

## Section 13: Deploying ARM templates

> [Terraform: Azure ARM templates](./resources/Terraform_004_Azure+ARM+templates.pdf)

## Section 14: Cloud Governance using Terraform

## Section 15: Terraform modules

- `main.tf`
- `variables.tf`
- `providers.tf`
- `outputs.tf`

> [Terraform: Modules dependency](./resources/Terraform+modules+dependency.pdf)
>
> `https://github.com/HoussemDellai/terraform-course/tree/main/130_module_dependencies`

More resources for modules:

- [Terraform registry](https://registry.terraform.io/)
- [Azure modules](https://registry.terraform.io/namespaces/Azure)
- [Azure VNET module](https://registry.terraform.io/modules/Azure/vnet/azurerm/latest)
- [Azure VNET module source code](https://github.com/Azure/terraform-azurerm-vnet)
- [Azure compute module](https://registry.terraform.io/modules/Azure/compute/azurerm/latest)

## Section 16: Deploying to multiple targets using multi-provider

> [Terraform: Multi-provider](./resources/Terraform_017_Multi-provider.pdf)

- `https://github.com/HoussemDellai/terraform-course/tree/main/25_multi_provider`

## Section 17: Import existing infrastructure into Terraform

- `https://github.com/HoussemDellai/terraform-course/tree/main/90_import_resource`
- `https://github.com/HoussemDellai/terraform-course/tree/main/91_import_terrafy`
- `https://github.com/HoussemDellai/terraform-course/tree/main/92_import_terraformer`
- `https://github.com/HoussemDellai/terraform-course/tree/main/93_import_terraform`

More tools to import resources

- [Terrafy](https://github.com/Azure/aztfy)
- [Terraformer](https://github.com/GoogleCloudPlatform/terraformer)
- [Terraforming](https://github.com/dtan4/terraforming)

## Section 18: Terraform features

- `https://github.com/HoussemDellai/terraform-course/tree/main/21_data_sources`

> [Terraform: Count vs For Each](./resources/Terraform_011_Count+vs+For_Each.pdf)

## Section 19: Deploy to Kubernetes using Terraform provider

## Section 20: Deploy Helm Charts to Kubernetes using Terraform provider

## Section 21: Resource visualization with Rover

- `https://github.com/HoussemDellai/terraform-course/tree/main/24_rover_graph`

## Section 22: Service Principal for securing Terraform deployments

## Section 23: Automated testing using Terratest

- `https://github.com/HoussemDellai/terraform-course/tree/main/41_tf_terratest`
- `https://github.com/HoussemDellai/terraform-course/tree/main/42_terratest_rg`
- `https://github.com/HoussemDellai/terraform-course/tree/main/43_terratest_aks`

## Section 24: Detecting misconfigurations in Terraform

- `https://github.com/HoussemDellai/terraform-course/tree/main/60_scan_checkov`

## Section 25: Multi-layer architecture

> [Terraform: multi-layer](./resources/Terraform_012_TF+multi-layer.pdf)

## Section 26: AzApi provider to extend support for resources in Terraform

- `https://github.com/HoussemDellai/terraform-course/tree/main/120_azapi_provider`
- `https://github.com/HoussemDellai/terraform-course/tree/main/121_appservice_domain`

## Section 27: Azure DevOps provider for Terraform

- [Azure DevOps Provider](./resources/Azure+DevOps+provider.pdf)

## Section 28: Container Apps Landing Zone implementation

## Section 29: DevOps for Terraform
