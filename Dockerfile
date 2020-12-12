FROM debian

RUN apt-get update
RUN apt-get install -y bash curl openjdk-11-jdk
RUN rm -rf /var/lib/apt/lists/*
