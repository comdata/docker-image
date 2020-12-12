FROM debian:slim

RUN apt-get update
RUN apt-get install -y bash curl openjdk-11-jdk
