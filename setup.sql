DROP DATABASE IF EXISTS passwords;

CREATE DATABASE passwords;

DROP USER IF EXISTS 'passwords_db_user'@'localhost';

CREATE USER 'passwords_db_user'@'localhost' IDENTIFIED BY 'unlock@b4';
GRANT ALL ON passwords.* TO 'passwords_db_user'@'localhost';

USE passwords;

CREATE TABLE IF NOT EXISTS website (
  website_name VARCHAR(128) NOT NULL,
  website_url  VARCHAR(128) NOT NULL,
  PRIMARY KEY  (website_url)
);

CREATE TABLE IF NOT EXISTS user (
  website_url VARCHAR(128)  NOT NULL,
  user_id     SMALLINT(5)  NOT NULL,
  user_name   VARCHAR(128) NOT NULL,
  PRIMARY KEY (website_url, user_id)
);

CREATE TABLE IF NOT EXISTS password (
  website_url  VARCHAR(128)  NOT NULL,
  user_id      SMALLINT(5)  NOT NULL,
  password     VARBINARY(512) NOT NULL,
  timestamp    DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (website_url, user_id, password)
);

SET block_encryption_mode = 'aes-256-cbc';

source commands.sql;
