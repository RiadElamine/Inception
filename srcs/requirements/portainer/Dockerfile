FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y wget php7.4 php-mysql wget 

RUN wget https://github.com/portainer/portainer/releases/download/2.27.9/portainer-2.27.9-linux-amd64.tar.gz && \
    tar -xzf portainer-2.27.9-linux-amd64.tar.gz && \
    rm portainer-2.27.9-linux-amd64.tar.gz

COPY ./tools/script.sh /usr/local/bin/script.sh

RUN chmod +x /usr/local/bin/script.sh

CMD ["script.sh"]