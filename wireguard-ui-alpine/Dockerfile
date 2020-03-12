FROM golang:alpine AS builder
RUN apk add git
WORKDIR /tmp
RUN git clone https://github.com/EmbarkStudios/wireguard-ui.git
WORKDIR /tmp/wireguard-ui
RUN go get github.com/go-bindata/go-bindata/... \
    && go get github.com/elazarl/go-bindata-assetfs/...
RUN go mod download
RUN go-bindata-assetfs -prefix ui/dist ui/dist \
    && go install .

FROM alpine:latest
RUN apk add nftables
COPY --from=builder /go/bin/wireguard-ui /
ENTRYPOINT [ "/wireguard-ui" ]