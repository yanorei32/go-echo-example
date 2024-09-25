FROM golang:1.22.4 AS build-env
MAINTAINER yanorei32

COPY . /root/build

RUN cd /root/build && CGO_ENABLED=0 go build

FROM alpine:3.20.3@sha256:beefdbd8a1da6d2915566fde36db9db0b524eb737fc57cd1367effd16dc0d06d
COPY --from=build-env \
	/root/build/go-echo-example \
	/usr/bin/go-echo-example

CMD ["/usr/bin/go-echo-example"]
