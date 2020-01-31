FROM centos:centos7
RUN yum install epel-release -y
RUN yum install -y nginx 
RUN yum install -y mc 
RUN yum install -y php-fpm 
RUN yum install -y php-cli 
RUN yum install -y php-mysql 
RUN yum install -y php-gd 
RUN yum install -y php-ldap 
RUN yum install -y php-odbc 
RUN yum install -y php-pdo 
RUN yum install -y php-pecl-memcache 
RUN yum install -y php-pear 
RUN yum install -y php-xml 
RUN yum install -y php-xmlrpc 
RUN yum install -y php-mbstring 
RUN yum install -y php-snmp 
RUN yum install -y php-soap
RUN sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php.ini
RUN sed -i 's/listen = 127.0.0.1:9000/listen = \/var\/run\/php-fpm\/php-fpm.sock/g' /etc/php-fpm.d/www.conf
RUN sed -i 's/;listen.owner = nobody/listen.owner = nobody/g' /etc/php-fpm.d/www.conf
RUN sed -i 's/;listen.group = nobody/listen.group = nobody/g' /etc/php-fpm.d/www.conf
RUN sed -i 's/user = apache/user = nginx/g' /etc/php-fpm.d/www.conf
RUN sed -i 's/group = apache/group = nginx/g' /etc/php-fpm.d/www.conf
COPY source/default.conf /etc/nginx/conf.d/default.conf
COPY source/info.php /usr/share/nginx/html/info.php