FROM golang:alpine AS builder

RUN true \
  && apk add -U --no-cache \
    binutils \
    ca-certificates \
    git \
    gcc \
    musl-dev

ADD . /drone-delay-config
WORKDIR /drone-delay-config

RUN true \
  && go build -o drone-delay-config \
  && strip drone-delay-config

# ---

FROM alpine:3.6 as alpine
RUN apk add -U --no-cache ca-certificates

FROM alpine:3.6
EXPOSE 3000

ENV GODEBUG netdns=go

COPY --from=alpine /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

COPY --from=builder /drone-delay-config/drone-delay-config /usr/local/bin
CMD /usr/local/bin/drone-delay-config
