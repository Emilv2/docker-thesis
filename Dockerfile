FROM debian:stretch-slim

MAINTAINER Emil Vanherp emil@vanherp.me

RUN apt-get update && apt-get install -y \
      biber \
      latexmk \
      make \
      texlive-full \
      bash \
      openjdk-8-jre-headless \
      unzip

ENV VERSION 4.3
ADD https://www.languagetool.org/download/LanguageTool-$VERSION.zip /LanguageTool-$VERSION.zip

RUN unzip LanguageTool-$VERSION.zip \
    && rm LanguageTool-$VERSION.zip
