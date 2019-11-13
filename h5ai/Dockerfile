FROM alpine:3.10

RUN apk --no-cache add php7 php7-fpm php7-json php7-phar php7-iconv php7-openssl php7-zlib php7-session unzip nginx supervisor curl

COPY config/nginx.conf /etc/nginx/nginx.conf
RUN rm /etc/nginx/conf.d/default.conf

COPY config/fpm-pool.conf /etc/php7/php-fpm.d/www.conf
COPY config/php.ini /etc/php7/conf.d/custom.ini

COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN curl -o /tmp/h5ai.zip https://release.larsjung.de/h5ai/h5ai-0.29.2.zip

RUN unzip -qo /tmp/h5ai.zip -d /usr/share/h5ai

COPY class-setup.php.patch class-setup.php.patch
RUN patch -p1 -u /usr/share/h5ai/_h5ai/private/php/core/class-setup.php -i /class-setup.php.patch && rm class-setup.php.patch

RUN chown -R nobody.nobody /run && \
  chown -R nobody.nobody /var/lib/nginx && \
  chown -R nobody.nobody /var/tmp/nginx && \
  chown -R nobody.nobody /var/log/nginx

RUN chown nobody.nobody /usr/share/h5ai/_h5ai/public/cache/
RUN chown nobody.nobody /usr/share/h5ai/_h5ai/private/cache/

WORKDIR /var/www

VOLUME /var/www

EXPOSE 80

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

HEALTHCHECK --timeout=10s CMD curl --silent --fail http://127.0.0.1/fpm-ping
