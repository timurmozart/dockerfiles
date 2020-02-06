FROM mysql/mysql-server:latest

ENV MYSQL_ROOT_PASSWORD=ASdf456+
ENV MYSQL_USER=drupal
ENV MYSQL_PASSWORD=drupal
RUN yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -y
RUN echo '    CREATE DATABASE drupal CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;' > script.mysql
RUN ls
RUN yum install telnet -y
RUN yum install mc -y
RUN echo '[mysql]' >> ~/my.cnf 
RUN echo 'user=root' >> ~/my.cnf 
RUN echo 'password=ASdf456+' >> ~/my.cnf 

RUN cat /etc/my.cnf  
# RUN telnet 127.0.0.1:3306

RUN echo 'CREATE DATABASE drupal CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;' >> mysql.mysql
RUN echo 'ALTER USER 'drupal'@'%' IDENTIFIED WITH mysql_native_password BY 'drupal'; ' >> mysql.mysql
RUN echo 'GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, CREATE TEMPORARY TABLES ON drupal.* TO 'drupal'@'%';' >> mysql.mysql

RUN cat mysql.mysql
EXPOSE 3306
# ENTRYPOINT [ "mysql -uroot < /mysql.mysql" ]

