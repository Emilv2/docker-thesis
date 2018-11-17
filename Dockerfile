FROM debian:stretch-slim

MAINTAINER Emil Vanherp emil@vanherp.me

RUN set -ex \
    && mkdir -p /uploads /etc/apt/sources.list.d /var/cache/apt/archives/ \
    && echo "deb http://ftp.debian.org/debian stretch-backports main" > /etc/apt/sources.list.d/stretch.backports.list \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get clean \
    && apt-get update -y \
    && apt-get -t stretch-backports install -y \
        bash \
        openjdk-8-jre-headless \
        unzip

ENV VERSION 4.3
ADD https://www.languagetool.org/download/LanguageTool-$VERSION.zip /LanguageTool-$VERSION.zip

RUN unzip LanguageTool-$VERSION.zip \
    && rm LanguageTool-$VERSION.zip

RUN apt-get update && apt-get install -y \
      biber \
      latexmk \
      make \
      texlive-full
