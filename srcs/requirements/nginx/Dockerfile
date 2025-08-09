FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y nginx openssl

RUN mkdir /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx.key \
    -out /etc/nginx/ssl/nginx.crt \
    -subj "/C=MA/ST=Khouribga/L=Khouribga/O=42 School/OU=Inception/CN=relamine.42.fr"
COPY ./tools/default /etc/nginx/sites-enabled/default

CMD [ "nginx", "-g", "daemon off;" ]