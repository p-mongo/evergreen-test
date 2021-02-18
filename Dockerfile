FROM ubuntu:bionic

RUN apt-get update && \
  apt-get install -y lsb-release curl python3-pip

COPY . .
RUN ./run-python.sh
