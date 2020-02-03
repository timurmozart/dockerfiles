FROM ubuntu:18.04
# ENV APPS \
#     nginx \
#     php-fpm \
#     php-cli \
#     php-mcrypt \
#     memcached 
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install nginx -y
RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:ondrej/php -y
RUN apt-get update -y
RUN apt-get install php7.3-fpm -y
# RUN apt-get install vim -y
# RUN apt-get install -y mc
RUN sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 127.0.0.1:9000/g' /etc/php/7.3/fpm/pool.d/www.conf
# RUN sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/g' /etc/ssh/sshd_config

RUN mkdir /run/php/
COPY source/default /etc/nginx/sites-available/default
COPY source/info.php /var/www/html/info.php
COPY source/start.sh /root/start.sh

EXPOSE 80
CMD [ "/root/start.sh" ]