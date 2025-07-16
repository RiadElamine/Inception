#!/bin/bash

mkdir -p /run/php
chown www-data:www-data /run/php

cd /var/www/html
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
wp core download --allow-root
wp config create \
  --dbname=${db_name} \
  --dbuser=${db_user} \
  --dbpass=${db_pwd} \
  --dbhost=mariadb \
  --dbprefix=wp_ \
  --allow-root \
  --force
wp core install \
  --url=${domain_name} \
  --title=${title} \
  --admin_user=${admin_user} \
  --admin_password=${admin_pwd} \
    --admin_email=${admin_email} \
  --allow-root
wp user create "${wp_user}" "${wp_email}" --user_pass="${wp_pwd}" --role=author --allow-root

sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

/usr/sbin/php-fpm7.4 -F