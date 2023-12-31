FROM        --platform=$TARGETOS/$TARGETARCH python:3.11-slim

LABEL       author="Blacksquadman1" maintainer=""

RUN         apt update \
            && apt -y install git gcc g++ ca-certificates pkg-config default-libmysqlclient-dev dnsutils curl iproute2 ffmpeg procps \
            && useradd -m -d /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]