FROM debian:7

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qq update \
&& apt-get -qq -y --no-install-recommends install \
    curl \
    tar \
    openjdk-7-jre \
    make \
&& apt-get clean

ENV PLOVR_DIR /usr/local/bin
ENV PLOVR $PLOVR_DIR/plovr.jar
ENV PLOVR_VERSION 1.1.0

RUN mkdir -p $PLOVR_DIR \
&& curl -s https://registry.npmjs.org/plovr/-/plovr-$PLOVR_VERSION.tgz \
 | tar -xOz package/bin/plovr.jar > $PLOVR

EXPOSE 9810

WORKDIR /data
