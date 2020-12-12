FROM debian:bullseye-slim

RUN apt-get update
RUN apt-get install -y make bash curl openjdk-15-jdk maven docker
