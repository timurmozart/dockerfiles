CREATE DATABASE drupal CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci; 
ALTER USER 'drupal'@'%' IDENTIFIED WITH mysql_native_password BY 'drupal'; 
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, CREATE TEMPORARY TABLES ON drupal.* TO 'drupal'@'%';
quit;
