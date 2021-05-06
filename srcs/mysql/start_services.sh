#!/bin/sh
#telegraf

#rc-service mariadb start
#
#mysql_install_db --user=mysql --datadir=/var/lib/mysql
#mysql admin -u root password toor
#
#mysqld -u root
#rc-service mysql restart
#echo "CREATE DATABASE wordpress;"| mysql -u root --skip-password
#echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;"| mysql -u root --skip-password
#echo "FLUSH PRIVILEGES;"| mysql -u root --skip-password
#echo "update mysql.user set plugin='' where user='root';"| mysql -u root --skip-password
#sh



rc default
/etc/init.d/mariadb setup
rc-service mariadb start

# Create database.
mysql -u root mysql < create_db.sql

# Init my wordpress database.
mysql -u root wordpress < mysql-service.sql

rc-service mariadb stop
/usr/bin/supervisord