FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y redis-server

CMD [ "redis-server","--maxmemory", "200mb", "--maxmemory-policy", "allkeys-lru", "--bind", "0.0.0.0" , "--protected-mode", "no" ]
