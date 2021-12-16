resource "null_resource" "kind-cluster" {
  provisioner "local-exec" {
    command = "/usr/local/bin/kind  create cluster --config ./giropops.yaml"
  }

  provisioner "local-exec" {
    when = destroy
    command = "/usr/local/bin/kind delete cluster --name giropops"
  }
}
