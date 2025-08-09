FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y nginx

COPY ./tools/default /etc/nginx/sites-enabled/default

COPY ./tools/www /var/www/html

CMD [ "nginx", "-g", "daemon off;" ]