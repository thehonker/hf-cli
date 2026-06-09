FROM docker.io/alpine:3

RUN set -exu \
  && apk add --no-cache \
    bash \
    curl \
    git \
    python3 \
    wget

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

COPY ./entrypoint.sh /entrypoint.sh

USER hfcli

WORKDIR /home/hfcli

RUN set -exu \
  && curl -LsSf https://hf.co/cli/install.sh | bash

COPY ./hfdl.sh $HOME/.local/bin/hfdl

RUN set -exu \
  && chmod +x $HOME/.local/bin/hfdl

ENTRYPOINT ["/bin/bash"]
CMD ["/entrypoint.sh"]
