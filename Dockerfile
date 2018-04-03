FROM google/cloud-sdk:193.0.0-alpine

# docker-credential-gcr + docker are needed to configure the credentials
# for pushing to Docker registries

ARG HELM_VERSION=2.8.2
# Docker version is the same as the one used in Kubernetes
ARG DOCKER_VERSION=17.03.2

RUN curl -sSL http://storage.googleapis.com/kubernetes-helm/helm-v${HELM_VERSION}-linux-amd64.tar.gz -o helm.tar.gz \
 && tar -xf helm.tar.gz \
 && mv linux-amd64/helm /usr/local/bin \
 && rm -rf linux-amd64 \
 && rm -f helm.tar.gz

RUN curl -fsSL https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}-ce.tgz -o /tmp/docker-${DOCKER_VERSION}-ce.tgz \
 && tar xf /tmp/docker-${DOCKER_VERSION}-ce.tgz -C /tmp \
 && mv /tmp/docker/docker /usr/local/bin \
 && rm -r /tmp/docker-${DOCKER_VERSION}-ce.tgz /tmp/docker

RUN gcloud components install kubectl docker-credential-gcr
