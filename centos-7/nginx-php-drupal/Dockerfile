FROM centos:centos7
ENV APPS \
    nginx \
    php-cli \
    php-fpm \
    php-mysql \
    php-json \
    php-opcache \
    php-mbstring \
    php-xml \
    php-gd \
    php-curl \
    git \
    mc




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

ADD https://www.drupal.org/download-latest/tar.gz /drupal-8.8.2.tar.gz
RUN tar -xzf drupal-8.8.2.tar.gz 
RUN ls -la /drupal-8.8.2
RUN mv /drupal-8.8.2 /var/www/html/drupal
RUN ls -la /var/www/html/drupal

EXPOSE 80
CMD [ "/root/start.sh" ]