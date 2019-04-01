ARG NODE_VERSION=10

FROM node:${NODE_VERSION}

ARG DOCKER_VERSION=17.03.2-ce
ARG GCLOUD_VERSION=239.0.0

WORKDIR /home/jenkins

RUN curl -f https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz | \
  tar xzv && \
  mv docker/docker /usr/bin/ && \
  rm -rf docker

RUN curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" \
  -o /usr/local/bin/docker-compose && \
  chmod +x /usr/local/bin/docker-compose

RUN curl -f https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${GCLOUD_VERSION}-linux-x86_64.tar.gz | \
  tar xzv && \
  mv google-cloud-sdk /usr/bin/
ENV PATH=$PATH:/usr/bin/google-cloud-sdk/bin

CMD ["docker", "version"]
