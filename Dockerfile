FROM docker.io/alpine:3

RUN set -exu \
  && apk add --no-cache \
    bash \
    curl \
    wget \
    python3

RUN set -exu \
  && addgroup \
    --gid 1101 \
    hfcli \
  && adduser \
    --uid 1101 \
    --ingroup hfcli \
    --disabled-password \
    --gecos hfcli \
    --shell /bin/bash \
    hfcli

USER hfcli

WORKDIR /home/hfcli

RUN set -exu \
  && curl -LsSf https://hf.co/cli/install.sh | bash

RUN set -exu \
  echo "export PATH=\$HOME/.local/bin:\$PATH" | tee -a $HOME/.bashrc
