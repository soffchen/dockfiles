FROM alpine:latest

RUN apk --no-cache add curl php7-apache2 php7-cli php7-json php7-phar php7-iconv php7-openssl php7-zlib php7-session unzip

RUN rm -rf /var/cache/apk/* /var/www/localhost/htdocs/index.html

RUN curl -o /tmp/h5ai.zip https://release.larsjung.de/h5ai/h5ai-0.29.2.zip

ADD ./entrypoint.sh /

EXPOSE 80

VOLUME [ "/h5ai" ]

ENTRYPOINT ["/entrypoint.sh"]
