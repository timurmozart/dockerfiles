FROM mysql/mysql-server:latest
ENV MYSQL_USER=drupal
ENV MYSQL_PASSWORD=drupal
ENV MYSQL_ROOT_PASSWORD=ASdf456+
ENV MYSQL_ROOT_HOST=%
COPY ./mysql.sql /docker-entrypoint-initdb.d/
EXPOSE 3306


