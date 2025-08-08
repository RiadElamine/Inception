FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y wget php7.4 php-mysql

COPY ./tools/script.sh /usr/local/bin/script.sh

RUN chmod +x /usr/local/bin/script.sh

CMD ["script.sh"]