FROM debian:bullseye-slim

RUN apt-get update
RUN apt-get install -y make bash curl openjdk-11-jdk maven docker
