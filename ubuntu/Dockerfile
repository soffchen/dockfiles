FROM ubuntu:latest

RUN sed -i "s/archive.ubuntu.com/mirrors.aliyun.com/g" /etc/apt/sources.list \
    && apt-get update && apt-get install -y --no-install-recommends apt-utils

RUN apt-get install -y --no-install-recommends build-essential git ca-certificates libssl-dev

RUN apt-get -y upgrade && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
