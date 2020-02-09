FROM alpine:latest
ENV TIMEZONE="Europe/Kiev"
ENV APKS \
    nginx \  
    php-cli \
    php-fpm \
    php-mysqli \
    php-json \
    php-opcache \
    php-mbstring \
    php-xml \
    php-gd \
    php-curl \
    php-dom \
    php-pdo \
    php-pdo_mysql \
    php-session \
    php-simplexml \
    php-tokenizer \
    git \
    mc \
    composer


ADD https://dl.bintray.com/php-alpine/key/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub
RUN apk --update add ca-certificates \
 && echo "https://dl.bintray.com/php-alpine/v3.9/php-7.3" >> /etc/apk/repositories \
 && apk add -U --no-cache ${APKS} \
 && mkdir -p /var/www/drupal \
 && chown -R nginx:nginx /var/lib/nginx \
 && chown -R nginx:nginx /var/www \
 && chown -R nginx:nginx /var/log/nginx \
 && chown -R nginx:nginx /var/log/php7 \
 && mkdir /var/run/nginx \
 && touch /var/run/nginx/nginx.pid \
 && chown -R nginx:nginx /var/run/nginx/nginx.pid \
 && echo "${TIMEZONE}" > /etc/timezone
COPY ./copy/php.ini /etc/php7/php.ini
COPY ./copy/nginx.conf /etc/nginx/nginx.conf 
# RUN mkdir /var/www/drupal
RUN cd /var/www/drupal \
 && composer create-project drupal-composer/drupal-project:8.x-dev some-dir --stability dev --no-interaction \
 && cp -r some-dir/. ./ && rm -rf some-dir/

RUN chown -R nginx:nginx /var/www/

COPY ./copy/start.sh /files/start.sh
EXPOSE 8080
USER nginx
CMD [ "/files/start.sh" ]
