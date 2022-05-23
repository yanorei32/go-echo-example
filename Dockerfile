FROM golang:1.18.1 AS build-env
MAINTAINER yanorei32

COPY . /root/build

RUN cd /root/build && CGO_ENABLED=0 go build

FROM alpine:3.16.0
COPY --from=build-env \
	/root/build/go-echo-example \
	/usr/bin/go-echo-example

CMD ["/usr/bin/go-echo-example"]
