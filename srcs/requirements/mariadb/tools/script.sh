#!/bin/bash

service mariadb start

mysql -e "CREATE DATABASE IF NOT EXISTS \`${db_name}\`;"
mysql -e "CREATE USER IF NOT EXISTS '${db_user}'@'%' IDENTIFIED BY '${db_pwd}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${db_name}\`.* TO '${db_user}'@'%';"
mysql -e "FLUSH PRIVILEGES;"

mysqladmin shutdown

mysqld