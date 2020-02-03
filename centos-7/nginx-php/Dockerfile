FROM centos:centos7
ENV APPS \
    nginx \
    mc \
    php-fpm \
    php-cli \
    php-mysql \
    php-mcrypt \
    memcached \
    php-apc
RUN yum install epel-release -y
RUN yum install -y ${APPS}

COPY source/nginx.conf /etc/nginx/nginx.conf
COPY source/php.ini /etc/php.ini
COPY source/php-fpm.conf /etc/php-fpm.conf
COPY source/info.php /var/www/html/info.php
COPY source/start.sh /root/start.sh

EXPOSE 80
CMD [ "/root/start.sh" ]