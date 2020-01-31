FROM alpine:latest

ENV TIMEZONE="Europe/Kiev"
ENV APKS \
    nginx \  
    tzdata \
    php-cli \
    php-fpm \
    php-common \
    php-mysqli \
    php-xml \
    php-xmlrpc \
    php-curl \
    php-gd \
    # imagick \
    php-cli \
    php-dev \
    php-imap \
    php-mbstring \
    php-opcache \
    php-soap \
    php-zip \
    php-intl \
    curl \
    wget \
    mc

ADD https://dl.bintray.com/php-alpine/key/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub
RUN apk --update add ca-certificates \
 && echo "https://dl.bintray.com/php-alpine/v3.9/php-7.3" >> /etc/apk/repositories \
 && apk add -U --no-cache ${APKS} \
 && adduser -D -g 'www' www \
 && mkdir /www \
 && mkdir /run/nginx/ \
 && mkdir /run/php-fpm7/ \
 && chown -R www:www /var/lib/nginx \
 && chown -R www:www /www \
 && echo "${TIMEZONE}" > /etc/timezone

COPY ./copy/ /files
RUN cp /files/nginx.conf /etc/nginx/nginx.conf \
 && cp /files/index.html /www/index.html \
 && cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime \
 && cp /files/phpinfo.php /www/phpinfo.php \
 && cp -f /files/www.conf /etc/php7/php-fpm.d/www.conf \
 && cp -f /files/php.ini /etc/php7/php.ini
EXPOSE 80

CMD [ "/files/start.sh" ]