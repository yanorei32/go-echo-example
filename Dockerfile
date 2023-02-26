FROM golang:1.20.0 AS build-env
MAINTAINER yanorei32

COPY . /root/build

RUN cd /root/build && CGO_ENABLED=0 go build

FROM alpine:3.17.2@sha256:e2e16842c9b54d985bf1ef9242a313f36b856181f188de21313820e177002501
COPY --from=build-env \
	/root/build/go-echo-example \
	/usr/bin/go-echo-example

CMD ["/usr/bin/go-echo-example"]
