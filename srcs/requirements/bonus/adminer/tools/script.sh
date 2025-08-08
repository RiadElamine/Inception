#!/bin/bash
cd /var/www/html
if [ ! -f adminer.php ]; then
  wget "http://www.adminer.org/latest.php" -O adminer.php
fi

exec php -S 0.0.0.0:8080

