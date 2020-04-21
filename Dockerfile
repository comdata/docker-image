FROM docker

RUN apk update

RUN apk add make bash curl openjdk11 maven docker