FROM google/cloud-sdk:198.0.0

ARG HELM_VERSION=2.9.1
ARG ISTIO_VERSION=0.8.0

RUN curl -sSL http://storage.googleapis.com/kubernetes-helm/helm-v${HELM_VERSION}-linux-amd64.tar.gz -o helm.tar.gz \
 && tar -xf helm.tar.gz \
 && mv linux-amd64/helm /usr/local/bin \
 && rm -rf linux-amd64 \
 && rm -f helm.tar.gz

RUN apt-get update && apt-get install -y jq \
 && rm -rf /var/lib/apt/lists/*

RUN curl -sSL https://github.com/istio/istio/releases/download/${ISTIO_VERSION}/istio-${ISTIO_VERSION}-linux.tar.gz -o istio-${ISTIO_VERSION}-linux.tar.gz \
 && tar -xf istio-${ISTIO_VERSION}-linux.tar.gz \
 && mv istio-${ISTIO_VERSION}/bin/istioctl /usr/local/bin/ \
 && rm -rf istio-{ISTIO_VERSION} \
 && rm -f istio-${ISTIO_VERSION}-linux.tar.gz

