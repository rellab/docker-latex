FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# 必要なパッケージをインストール
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    texlive-latex-recommended \
    texlive-science \
    texlive-fonts-extra \
    texlive-latex-extra \
    texlive-pictures \
    texlive-fonts-recommended \
    texlive-lang-japanese \
    latexmk \
    graphviz \
    ghostscript \
    aspell aspell-en \
    locales \
    fonts-noto-cjk && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 日本語ロケールを設定
RUN locale-gen ja_JP.UTF-8 && \
    update-locale LANG=ja_JP.UTF-8
ENV LANG=ja_JP.UTF-8
ENV LANGUAGE=ja_JP:ja
ENV LC_ALL=ja_JP.UTF-8

WORKDIR /work