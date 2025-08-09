FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y mariadb-server

COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld

COPY ./tools/script.sh /usr/local/bin/script.sh

RUN chmod +x /usr/local/bin/script.sh

CMD ["script.sh"]