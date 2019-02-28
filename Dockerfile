FROM wilkesystems/steamcmd:latest

ENV BUTLER_VERSION 15.8.0

RUN \
  # Install some cool shit from apt-get.
  apt-get update ; \
  apt-get install -y \
    curl \
    unzip \
  ; \
  rm -rf /var/lib/apt/lists/* /tmp/*

RUN \
  # Install itch.io butler
  mkdir butler-wd && cd butler-wd && \
  curl -L -o butler.zip https://broth.itch.ovh/butler/linux-amd64/${BUTLER_VERSION}/archive/default && \
  unzip butler.zip && rm butler.zip && \
  cp -v * /bin/ && \
  chmod 755 /bin/butler && \
  cd / && rm -rf butler-wd && \
  butler -V && \
  butler upgrade
