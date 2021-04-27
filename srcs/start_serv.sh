#!/bin/bash

service mysql start
service php7.3-fpm start

# Configure a wordpress database
mysql -u root --skip-password -e "CREATE DATABASE wordpress;"
mysql -u root --skip-password -e "CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';"
mysql -u root --skip-password -e "GRANT ALL PRIVILEGES ON wordpress.* to 'admin'@'localhost';"
mysql -u root --skip-password -e "FLUSH PRIVILEGES;"

nginx -g 'daemon off;'