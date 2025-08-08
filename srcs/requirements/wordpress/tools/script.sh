#!/bin/bash

mkdir -p /run/php
chown www-data:www-data /run/php

cd /var/www/html

validate_username() {
    lower_username=`echo $1 | awk '{print tolower($0)}'`
    echo $lower_username

    if [[ $lower_username == *admin* ]]; then
        echo "Error: Username cannot contain 'admin' or 'administrator'." >&2
        return 1 
    fi
    return 0  
}

if [ ! -f wp-config.php ]; then


  if validate_username $admin_user ; then
      echo "Username is valid!"
  else
      echo "Username is invalid!" >&2
      exit 1
  fi

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


  wp plugin install redis-cache --activate --allow-root
  wp config set WP_REDIS_HOST redis --allow-root
  wp config set WP_REDIS_PORT 6379 --raw --allow-root
  wp config set WP_CACHE true --raw --allow-root
  wp redis enable --allow-root
else
  echo "WordPress is already installed."
fi

sed -i 's#listen = /run/php/php7.4-fpm.sock#listen = 9000#g' /etc/php/7.4/fpm/pool.d/www.conf

exec /usr/sbin/php-fpm7.4 -F