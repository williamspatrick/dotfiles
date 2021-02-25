FROM ubuntu:groovy

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8

RUN apt-get update -q && \
    apt-get upgrade -yq && \
    apt-get install -yq \
        lsb-release locales bash-completion tzdata ca-certificates && \
    locale-gen en_US.UTF-8 && \
    apt install -y offlineimap && \
    rm -rf /var/lib/apt/lists/*

RUN update-ca-certificates

ENV HOME=/workdir
