FROM alpine:latest as builder

RUN apk update && apk add make gcc libc-dev

WORKDIR /tmp
RUN wget -O udpxy-src.tar.gz http://www.udpxy.com/download/udpxy/udpxy-src.tar.gz \
    && tar zxf udpxy-src.tar.gz \
    && cd udpxy-* && make && make install

FROM alpine:latest

COPY --from=builder /usr/local/bin/udpxy /usr/local/bin/udpxy
COPY --from=builder /usr/local/bin/udpxrec /usr/local/bin/udpxrec

ENTRYPOINT ["/usr/local/bin/udpxy"]
CMD ["-v", "-T", "-p", "4022"]
