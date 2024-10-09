DROP DATABASE IF EXISTS passwords;

CREATE DATABASE passwords;

DROP USER IF EXISTS 'passwords_db_user'@'localhost';

CREATE USER 'passwords_db_user'@'localhost' IDENTIFIED BY 'unlock@b4';
GRANT ALL ON passwords.* TO 'passwords_db_user'@'localhost';

USE passwords;


source commands.sql;
