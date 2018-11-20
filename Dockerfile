FROM debian:sid-slim

MAINTAINER Emil Vanherp emil@vanherp.me

RUN mkdir -p /usr/share/man/man1 && \
      apt-get update -y && \
      apt-get install -y openjdk-8-jdk \
      biber \
      latexmk \
      make \
      texlive-full \
      texlive-latex-extra \
      bash
  
ENV VERSION 0.6
ADD https://github.com/sylvainhalle/textidote/releases/download/v$VERSION/textidote.jar /opt/textidote/textidote.jar
RUN echo $'#!/bin/bash\njava -jar /opt/textidote/textidote.jar "$@"' > /usr/bin/textidote \
      chmod +x /usr/bin/textidote
