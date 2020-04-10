FROM alpine:latest as builder

RUN apk update && apk add git make gcc g++ libc-dev bash util-linux-dev

WORKDIR /tmp
RUN git clone https://github.com/clark15b/xupnpd2 \
    && cd xupnpd2 && make -f Makefile.linux

FROM alpine:latest

RUN apk update && apk add libc-utils util-linux libstdc++

COPY --from=builder /tmp/xupnpd2/www /www
COPY --from=builder /tmp/xupnpd2/xupnpd /xupnpd

VOLUME /media

EXPOSE 4044

ENTRYPOINT ["/xupnpd"]
