# zhangsean/kubectl

Containerized `kubectl` with `envsubst`、`curl`、`jq` based on alpine.

## Environment variables

Env name | Required | Description
---|---|---
K8S_URL | √ | Kubernetes API url
K8S_CA | | Kubernetes CA certificate string encoded by base64
K8S_TOKEN | Only for token authorization | Kubernetes user token
K8S_CER | Only for certificate authorization | Kubernetes user certificate string encoded by base64
K8S_KEY | Only for certificate authorization | Kubernetes user certificate key string encoded by base64

## Usage

```sh
# K8s authorize by token
docker run -it --rm \
    -e K8S_URL=https://10.18.59.21:6443 \
    -e K8S_TOKEN=kubeconfig-user-drnf9.c-h94qp:jxxpjgxf2f6pgxd...8xj9fh47bjs \
    zhangsean/kubectl \
    sh

# K8s authorize by certificate
docker run -it --rm \
    -e K8S_URL=https://10.18.59.21:6443 \
    -e K8S_CER=LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSU...RFLS0tLS0K \
    -e K8S_KEY=LS0tLS1CRUdJTiBSU0EgUFJJVkFURSBLRVktLS0tLQ...ktLS0tLQo= \
    zhangsean/kubectl \
    sh

# K8s authorize by certificate with ca
docker run -it --rm \
    -e K8S_URL=https://10.18.59.21:6443 \
    -e K8S_CA=LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUR...RS0tLS0tCg== \
    -e K8S_CER=LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSU...RFLS0tLS0K \
    -e K8S_KEY=LS0tLS1CRUdJTiBSU0EgUFJJVkFURSBLRVktLS0tLQ...ktLS0tLQo= \
    zhangsean/kubectl \
    sh

# config k8s cluster
kubeconfig

# kubectl has been authenticated
kubectl get po -A
```
