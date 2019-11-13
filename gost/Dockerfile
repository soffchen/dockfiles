FROM golang:alpine as builder

RUN apk add --no-cache git

WORKDIR /go/src/github.com/ginuerzh

RUN git clone https://github.com/ginuerzh/gost.git

RUN go install github.com/ginuerzh/gost/cmd/gost

FROM alpine:latest

WORKDIR /bin/

COPY --from=builder /go/bin/gost .

ENTRYPOINT ["/bin/gost"]

