FROM alpine

ARG arch

COPY ./external /external/
COPY ./scripts /scripts/
COPY ./${arch} /arch/

RUN apk update && apk upgrade
RUN apk add bash
RUN apk add qemu-system-x86_64

RUN sh /scripts/build-seeds.sh
RUN sh /scripts/build-stage0.sh
