FROM docker

RUN apk update

RUN apk add make bash curl openjdk14 maven docker
