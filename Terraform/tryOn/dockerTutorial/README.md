# Quick start tutorial - Terraform provision an NGINX server using Docker 

> `https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/docker-get-started#quick-start-tutorial`

```Shell
cd dockerTutorial/
cat main.tf 

terraform init

terraform apply

curl localhost:8000
docker container ps

terraform destroy

docker container ps
docker container ps -a

terraform apply

terraform fmt
terraform validate
terraform show

cat variables.tf 

terraform apply
terraform show

cat outputs.tf 
terraform apply -var "container_name=YetAnotherName"

terraform destroy
```
