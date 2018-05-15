FROM google/cloud-sdk:198.0.0

ARG HELM_VERSION=2.8.2

RUN curl -sSL http://storage.googleapis.com/kubernetes-helm/helm-v${HELM_VERSION}-linux-amd64.tar.gz -o helm.tar.gz \
 && tar -xf helm.tar.gz \
 && mv linux-amd64/helm /usr/local/bin \
 && rm -rf linux-amd64 \
 && rm -f helm.tar.gz

RUN apt-get update && apt-get install -y jq \
 && rm -rf /var/lib/apt/lists/*
