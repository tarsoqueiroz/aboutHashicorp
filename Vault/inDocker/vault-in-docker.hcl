storage "file" {
  path    = "/vault/file"
}

listener "tcp" {
  address = "0.0.0.0:8200"
  tls_disable = 1
}

api_addr = "http://0.0.0.0:8200"
ui = true
log_level = "INFO"
// license_path = "/opt/vault/vault.hcl"
