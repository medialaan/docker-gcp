FROM google/cloud-sdk:193.0.0-alpine

ARG HELM_VERSION=2.8.2

RUN curl -sSL http://storage.googleapis.com/kubernetes-helm/helm-v${HELM_VERSION}-linux-amd64.tar.gz -o helm.tar.gz \
 && tar -xf helm.tar.gz \
 && mv linux-amd64/helm /usr/local/bin \
 && rm -rf linux-amd64 \
 && rm -f helm.tar.gz

RUN gcloud components install kubectl docker-credential-gcr
