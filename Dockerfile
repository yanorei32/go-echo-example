FROM golang:1.22.4 AS build-env
MAINTAINER yanorei32

COPY . /root/build

RUN cd /root/build && CGO_ENABLED=0 go build

FROM alpine:3.20.2@sha256:0a4eaa0eecf5f8c050e5bba433f58c052be7587ee8af3e8b3910ef9ab5fbe9f5
COPY --from=build-env \
	/root/build/go-echo-example \
	/usr/bin/go-echo-example

CMD ["/usr/bin/go-echo-example"]
