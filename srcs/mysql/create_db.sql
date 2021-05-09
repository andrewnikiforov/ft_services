CREATE DATABASE wordpress;
CREATE USER 'omillan'@'%' IDENTIFIED BY 'pass';
GRANT ALL PRIVILEGES ON wordpress.* TO 'omillan'@'%';
FLUSH PRIVILEGES;