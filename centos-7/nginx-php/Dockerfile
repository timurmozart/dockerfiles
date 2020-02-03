FROM centos:centos7
ENV APPS \
    nginx \
    php-fpm \
    php-cli \
    php-mcrypt \
    memcached 
RUN yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -y \
 && yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y  \
 && yum install yum-utils -y  \
 && yum-config-manager --disable remi-php54  \
 && yum-config-manager --enable remi-php73 \
 && yum install -y ${APPS} \
 && mkdir /run/php-fpm/ \
 && yum clean all -y
    
COPY source/nginx.conf /etc/nginx/nginx.conf
COPY source/php.ini /etc/php.ini
COPY source/php-fpm.conf /etc/php-fpm.conf
COPY source/info.php /var/www/html/info.php
COPY source/start.sh /root/start.sh

EXPOSE 80
CMD [ "/root/start.sh" ]