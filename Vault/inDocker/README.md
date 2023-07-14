# Vault in Docker

Starting container:

```sh
dockerdocker-compose -f ./vault-in-docker-compose.yaml up -d

docker-compose -f vault-in-docker-compose.yaml ps
docker-compose -f vault-in-docker-compose.yaml logs
```

Unseal Keys:

```
Unseal Key 1: 5GJ1R4/TPD7u/CQqbh5zhbak1Fxnp0PG65uABeeW78A8
Unseal Key 2: AIQBGwy9Ln6LbQ9788skMmvnrfFic4qWzFDSGzkgB6Vw
Unseal Key 3: +5lMx9ZbR9LthuGTXW18SAHmRm+sXTuEOrhlTh0Bx57N
Unseal Key 4: Y/zV/LcGdWHMER2TBek1bWYPAPU1zCA+TVZLieK7Lftn
Unseal Key 5: /k7PV6qZ/aOkKIT8EAaNU8F3jvDzoKq+icxt2Yitx+IS
Unseal Key 6: 7h/quUVgOboAg0sBdmfY1vqRob3rhY5SWUTllccjfpR3

Initial Root Token: hvs.zYURP3iPoKDdFGYPaqns0A8E

Token Orphan: hvs.jWBpWsEOPYpkzQq6E4EQrGcX
```

```sh
export VAULT_ADDR='http://0a0f122c.nip.io:8200'
vault status
vault login hvs.zYURP3iPoKDdFGYPaqns0A8E

vault kv get -format=json customers/certificate | jq -r '.vault kv get -format=json customers/certificate | jq -r '.data.data.csr'
vault kv get -format=json customers/certificate | jq -r '.data.data.key'
```

1) Create policy

VAULT_ADDR=http://0a0f122c.nip.io:8200 VAULT_TOKEN=hvs.zYURP3iPoKDdFGYPaqns0A8E vault policy write customers-certificate customers-certificate-policy.hcl

2) Create a Role and Assign policy

VAULT_ADDR=http://0a0f122c.nip.io:8200 VAULT_TOKEN=hvs.zYURP3iPoKDdFGYPaqns0A8E vault write auth/approle/role/customers-certificate secret_id_ttl=60m  token_ttl=45m  token_max_tll=30m  policies="customers-certificate"

VAULT_ADDR=http://0a0f122c.nip.io:8200 VAULT_TOKEN=hvs.zYURP3iPoKDdFGYPaqns0A8E vault read auth/approle/role/customers-certificate


---curl

### List Roles on AppRole auth method

curl --header "X-Vault-Token: hvs.zYURP3iPoKDdFGYPaqns0A8E" --request LIST http://0a0f122c.nip.io:8200/v1/auth/approle/role | jq .

### Role creation in AppRole auth method

curl --header "X-Vault-Token: hvs.zYURP3iPoKDdFGYPaqns0A8E" --request POST --data @boiappRolePayload.json http://0a0f122c.nip.io:8200/v1/auth/approle/role/boiapp | jq .

### Getting info about Role

curl --header "X-Vault-Token: hvs.zYURP3iPoKDdFGYPaqns0A8E" http://0a0f122c.nip.io:8200/v1/auth/approle/role/boiapp | jq .

3) Push Code to Repository

4) Fetch Role ID

VAULT_ADDR=http://0a0f122c.nip.io:8200 VAULT_TOKEN=hvs.zYURP3iPoKDdFGYPaqns0A8E vault read auth/approle/role/customers-certificate/role-id
________________
Key        Value
---        -----
role_id    9e402e83-2215-f86c-a989-bac5301a4be7

### Getting role-id from Role

curl --header "X-Vault-Token: hvs.zYURP3iPoKDdFGYPaqns0A8E" http://0a0f122c.nip.io:8200/v1/auth/approle/role/boiapp/role-id | jq .

5) Write Role ID to the Machine Image

6) Generate Secret ID

VAULT_ADDR=http://0a0f122c.nip.io:8200 VAULT_TOKEN=hvs.zYURP3iPoKDdFGYPaqns0A8E vault write -f auth/approle/role/customers-certificate/secret-id
___________________________
Key                   Value
---                   -----
secret_id             38056c37-81ae-0260-a122-9a03ccd02a92
secret_id_accessor    1bfb17ed-028c-6c12-4d46-2ae5f70c631a
secret_id_ttl         15m

### Generate new Secret ID

curl --header "X-Vault-Token: hvs.zYURP3iPoKDdFGYPaqns0A8E" --request POST --data @boiappSecretPayload.json http://0a0f122c.nip.io:8200/v1/auth/approle/role/boiapp/secret-id | jq .

### List Secret ID accessors

curl --header "X-Vault-Token: hvs.zYURP3iPoKDdFGYPaqns0A8E" --request LIST http://0a0f122c.nip.io:8200/v1/auth/approle/role/boiapp/secret-id | jq .

### Read AppRole Secret ID info

curl --header "X-Vault-Token: hvs.zYURP3iPoKDdFGYPaqns0A8E" --request POST --data @boiappSecIDInfoPayload.json http://0a0f122c.nip.io:8200/v1/auth/approle/role/boiapp/secret-id/lookup | jq .


7) Deliver Secret ID to the Application


8) Use Role ID and Secret ID to Login
   Receive Vault Token

VAULT_ADDR=http://0a0f122c.nip.io:8200 vault write auth/approle/login role_id=9e402e83-2215-f86c-a989-bac5301a4be7 secret_id=38056c37-81ae-0260-a122-9a03ccd02a92
_____________________________
Key                     Value
---                     -----
token                   hvs.CAESIEpqhARdR3E93f7MO2xVDM2JsCcIHdZfDIEMnajyDqDNGh4KHGh2cy52d2lnTHVOSU9rYlNCREdzb3dmSGFWS3c
token_accessor          WVcvotuJTElf14GnUMMd6NPY
token_duration          15m
token_renewable         true
token_policies          ["customers-certificate" "default"]
identity_policies       []
policies                ["customers-certificate" "default"]
token_meta_role_name    customers-certificate

### Login with AppRole

curl -s --request POST --data @boiappLoginPayload.json http://0a0f122c.nip.io:8200/v1/auth/approle/login | jq .

### 

curl --header "X-Vault-Token: hvs.CAESIDqHaOx2PVWUIV9mzGvCNH9fZUe1Shr0W4wCti2WJWqDGh4KHGh2cy5yaHNPcXpwMmU1aUhXSHlzMUoxdFpKZVI" http://0a0f122c.nip.io:8200/v1/customers/data/certificate | jq .

curl -s --header "X-Vault-Token: hvs.CAESIDqHaOx2PVWUIV9mzGvCNH9fZUe1Shr0W4wCti2WJWqDGh4KHGh2cy5yaHNPcXpwMmU1aUhXSHlzMUoxdFpKZVI" http://0a0f122c.nip.io:8200/v1/customers/data/certificate | jq -r '.data.data.csr'


curl -s --header "X-Vault-Token: $(curl -s --request POST --data @boiappLoginPayload.json http://0a0f122c.nip.io:8200/v1/auth/approle/login | jq -r '.auth.client_token')" http://0a0f122c.nip.io:8200/v1/customers/data/certificate | jq -r '.data.data.csr'





export APP_TOKEN="hvs.CAESIL2kxzLh4Z162Spt_WZq3BXcAO2DcLYMVNwtg2aCbu0EGh4KHGh2cy5jVzdWdlF0dEtmc1BuSTVjZVZQOUs3UEc"

VAULT_ADDR=http://0a0f122c.nip.io:8200 VAULT_TOKEN=hvs.CAESIEpqhARdR3E93f7MO2xVDM2JsCcIHdZfDIEMnajyDqDNGh4KHGh2cy52d2lnTHVOSU9rYlNCREdzb3dmSGFWS3c vault kv get customers/certificate
VAULT_ADDR=http://0a0f122c.nip.io:8200 VAULT_TOKEN=hvs.CAESIEpqhARdR3E93f7MO2xVDM2JsCcIHdZfDIEMnajyDqDNGh4KHGh2cy52d2lnTHVOSU9rYlNCREdzb3dmSGFWS3c vault kv get -format=json customers/certificate
VAULT_ADDR=http://0a0f122c.nip.io:8200 VAULT_TOKEN=hvs.CAESIEpqhARdR3E93f7MO2xVDM2JsCcIHdZfDIEMnajyDqDNGh4KHGh2cy52d2lnTHVOSU9rYlNCREdzb3dmSGFWS3c vault kv get -format=json customers/certificate | jq -r '.data.data.csr'
VAULT_ADDR=http://0a0f122c.nip.io:8200 VAULT_TOKEN=hvs.CAESIEpqhARdR3E93f7MO2xVDM2JsCcIHdZfDIEMnajyDqDNGh4KHGh2cy52d2lnTHVOSU9rYlNCREdzb3dmSGFWS3c vault kv get -format=json customers/certificate | jq -r '.data.data.key'


