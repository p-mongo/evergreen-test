FROM ubuntu:bionic

RUN apt-get update && \
  apt-get install -y lsb-release curl

COPY . .
RUN ./run.sh
