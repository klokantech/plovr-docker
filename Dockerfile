FROM debian:8

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update \
&& apt-get -qq -y --no-install-recommends install \
    openjdk-7-jre \
    make \
    wget \
&& apt-get clean

ENV PLOVR_DIR /usr/local/bin
ENV PLOVR $PLOVR_DIR/plovr.jar
ENV PLOVR_VERSION 4.1.1

RUN mkdir -p $PLOVR_DIR && \
  wget --no-check-certificate -q -P $PLOVR_DIR \
  https://github.com/bolinfest/plovr/releases/download/v$PLOVR_VERSION/plovr.jar

EXPOSE 9810

WORKDIR /data
