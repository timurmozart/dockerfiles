FROM alpine:latest
ENV TIMEZONE="Europe/Kiev"
ENV APKS \
    nginx \  
    # php-cli \
    php-fpm 
    # php-mysqli \
    # php-json \
    # php-opcache \
    # php-mbstring \
    # php-xml \
    # php-gd \
    # php-curl


ADD https://dl.bintray.com/php-alpine/key/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub
RUN apk --update add ca-certificates \
 && echo "https://dl.bintray.com/php-alpine/v3.9/php-7.3" >> /etc/apk/repositories \
 && apk add -U --no-cache ${APKS} \
 && adduser -D -g 'www' www \
 && mkdir /www \
 && mkdir /run/nginx/ \
 && mkdir /run/php-fpm7/ \
 && chown -R nginx:nginx /var/lib/nginx \
 && chown -R nginx:nginx /www \
 && chown -R nginx:nginx /var/log/nginx \
 && chown -R nginx:nginx /var/log/php7 \
 && touch /var/run/nginx.pid \
 && chown -R nginx:nginx /var/run/nginx.pid \
 && echo "${TIMEZONE}" > /etc/timezone

COPY ./copy/ /files
RUN cp /files/nginx.conf /etc/nginx/nginx.conf \
 && cp /files/index.html /www/index.html \
#  && cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime \
 && cp /files/info.php /www/info.php \
 && cp -f /files/www.conf /etc/php7/php-fpm.d/www.conf \
 && cp -f /files/php.ini /etc/php7/php.ini
USER nginx
EXPOSE 8080

CMD [ "/files/start.sh" ]
