FROM golang:alpine as builder

RUN apk add --no-cache make git 

WORKDIR /tmp

RUN git clone https://github.com/Dreamacro/clash.git

RUN cd /tmp/clash && \
    go mod download && \
    make linux-amd64 && \
    mv ./bin/clash-linux-amd64 /clash

FROM alpine:latest

RUN apk add --no-cache ca-certificates

COPY --from=builder /clash /

ENTRYPOINT ["/clash"]

