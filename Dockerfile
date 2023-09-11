FROM ubuntu:22.04

ENV DEBIAN_FRONTEND nointeractive
RUN apt-get update &&\
    apt-get install -y \
    git \
    texlive-full \
    aspell aspell-en &&\
    apt-get clean &&\
    rm -fr /var/lib/apt/lists/*

WORKDIR /work
