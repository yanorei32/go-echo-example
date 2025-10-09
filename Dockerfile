FROM golang:1.25.2 AS build-env
MAINTAINER yanorei32

COPY . /root/build

RUN cd /root/build && CGO_ENABLED=0 go build

FROM alpine:3.22.2@sha256:4b7ce07002c69e8f3d704a9c5d6fd3053be500b7f1c69fc0d80990c2ad8dd412
COPY --from=build-env \
	/root/build/go-echo-example \
	/usr/bin/go-echo-example

CMD ["/usr/bin/go-echo-example"]
