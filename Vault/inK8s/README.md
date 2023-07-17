# Vault in Kubernetes

## K8s in Kind

- Installing

```sh
helm repo add hashicorp https://helm.releases.hashicorp.com

helm install vault hashicorp/vault
```

- Setup a Ingress Controller

```sh
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml

kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=90s
```

## Installing and Initializing Vault

```sh


```

```sh
Initial root token: hvs.4JPirEfqS8taZiu8PzTEeEoy

Key 1: F8U/47mdhdmzXk6Gg4gwkhdQO/17hErN86qTKJifp0Wt
Key 2: 7c4mlrdf8KMGki1bXJJbd0QicA2bj9cVScW2J4yuL60C
Key 3: TfOp1iww/QaTWCv6b5pDa/anoKYI6O1RY0WhC5Vsm2Ic
Key 4: xxih8lx9ZzCIJjVv2x0dnoKSZTJv94LAnpMONtKCS4CM
Key 5: ND2FPPN2wRHsxA+2d27D7RgR+ls+VFglk7XePl+vov97
Key 6: Idn3DaIQhw6VacguDiqiObIyqxVCQC9vNBTDFit33ZA/
```

