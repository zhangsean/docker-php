FROM alpine
LABEL MAINTAINER="SeanZhang <zxf2342@qq.com>"

COPY kubeconfig /usr/local/bin/

ENV K8S_RELEASE=v1.19.2

RUN apk --no-cache add jq gettext curl; \
    curl -LSo /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/${K8S_RELEASE}/bin/linux/amd64/kubectl; \
    chmod +x /usr/local/bin/kubectl
