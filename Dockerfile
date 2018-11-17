FROM debian:stretch-slim

MAINTAINER Emil Vanherp emil@vanherp.me

RUN mkdir -p /usr/share/man/man1 && \
      (echo "deb http://http.debian.net/debian stretch-backports main" > /etc/apt/sources.list.d/backports.list) && \
      apt-get update -y && \
      apt-get install -t stretch-backports openjdk-8-jdk -y
      apt-get install -y \
      biber \
      latexmk \
      make \
      texlive-full \
      bash \
      unzip
  
ENV VERSION 0.6
ADD https://github.com/sylvainhalle/textidote/releases/download/vVERSION/textidote.jar
