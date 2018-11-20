FROM debian:stretch-slim

MAINTAINER Emil Vanherp emil@vanherp.me

RUN mkdir -p /usr/share/man/man1 && \
      (echo "deb http://http.debian.net/debian stretch-backports main" > /etc/apt/sources.list.d/backports.list) && \
      apt-get update -y && \
      apt-get install -t stretch-backports openjdk-8-jdk -y \
      biber \
      latexmk \
      make \
      texlive-full \
      bash
  
ENV VERSION 0.6
ADD https://github.com/sylvainhalle/textidote/releases/download/v$VERSION/textidote.jar /opt/textidote/textidote.jar
RUN echo $'#!/bin/bash\njava -jar /opt/textidote/textidote.jar "$@"' > /usr/bin/textidote \
      chmod +x /usr/bin/textidote
