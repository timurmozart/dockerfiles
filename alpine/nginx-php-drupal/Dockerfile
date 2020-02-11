FROM alpine:latest
ENV TIMEZONE="Europe/Kiev"
ENV APKS \
    nginx \  
    # php-cli \
    php-fpm \
    php-mysqli \
    # php-json \
    php-opcache \
    php-mbstring \
    php-xml \
    php-gd \
    # php-curl \
    php-dom \
    php-pdo \
    php-pdo_mysql \
    php-session \
    php-tokenizer \
    php-simplexml \
    git \
    # mc \
    # tree \
    composer


ADD https://dl.bintray.com/php-alpine/key/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub 
RUN apk --update add ca-certificates \
 && echo "https://dl.bintray.com/php-alpine/v3.9/php-7.3" >> /etc/apk/repositories \
 && apk add -U --no-cache ${APKS} \
 && chown -R nginx:nginx /var/lib/nginx \
 && chown -R nginx:nginx /var/www \
 && chown -R nginx:nginx /var/log/nginx \
 && chown -R nginx:nginx /var/log/php7 \
 && mkdir /var/run/nginx \
 && touch /var/run/nginx/nginx.pid \
 && chown -R nginx:nginx /var/run/nginx/nginx.pid \
 && echo "${TIMEZONE}" > /etc/timezone
COPY ./copy /files
RUN cp files/php.ini /etc/php7/php.ini \
 && cp files/nginx.conf /etc/nginx/nginx.conf \
#  && tar -xzf /files/drupal-8.8.2.tar.gz \
#  && mv /drupal-8.8.2/ /drupal/ \
#  && mv /drupal /var/www/ \
 && mkdir /var/www/drupal \
 && mv /files/composer.json /var/www/drupal \
 && cd /var/www/drupal/ && composer install -o --no-cache \
 && rm -rf /files/drupal* \
 && chown -R nginx:nginx /var/www/
EXPOSE 8080
USER nginx
CMD [ "/files/start.sh" ]
