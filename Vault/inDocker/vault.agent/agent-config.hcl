pid_file = "./pidfile"

vault {
   address = "http://0a0f122c.nip.io:8200"
   tls_skip_verify = true
}

auto_auth {
   method {
      type = "token_file"
      config = {
         token_file_path = "/home/vagrant/hashicorp/token-vault"
      }
   }
   sink "file" {
      config = {
            path = "/home/vagrant/hashicorp/vault-token-via-agent"
      }
   }
}
