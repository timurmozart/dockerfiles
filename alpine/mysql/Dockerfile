FROM mysql/mysql-server:latest
ENV MYSQL_USER=drupal
ENV MYSQL_PASSWORD=drupal
COPY ./mysql.sql /docker-entrypoint-initdb.d/
EXPOSE 3306


