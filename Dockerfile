FROM debian:sid-slim

LABEL name="Docker-thesis" \
      version="0.0.1" \
      maintainer="Emil Vanherp emil@vanherp.me"

RUN mkdir -p /usr/share/man/man1 && \
      apt-get update -y && \
      apt-get install -y openjdk-8-jdk \
      biber \
      latexmk \
      make \
      texlive-full \
      texlive-latex-extra \
      poppler-utils \
      hunspell \
      hunspell-fr \
      hunspell-en-us \
      hunspell-nl \
      git \
      locales \
      locales-all \
      && apt-get clean

ENV VERSION 0.6
ADD https://github.com/sylvainhalle/textidote/releases/download/v$VERSION/textidote.jar /opt/textidote/textidote.jar
RUN echo $'#!/bin/sh\njava -jar /opt/textidote/textidote.jar "$@"' > /usr/bin/textidote && \
      chmod +x /usr/bin/textidote

# Set the locale
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

