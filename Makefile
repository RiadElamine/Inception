all: build

USERNAME := $(shell logname)

build:
	mkdir -p /home/${USERNAME}/data/mariadb
	mkdir -p /home/${USERNAME}/data/wordpress
	mkdir -p /home/${USERNAME}/data/portainer
	cd srcs && docker compose up -d --build

clean:
	cd srcs && docker compose down --volumes --rmi all
	docker container prune -f
	docker image prune -af
	docker volume prune -f
	sudo rm -rf /home/$(USERNAME)/data

fclean: clean
	docker system prune -af --volumes

re: clean all

up:
	cd srcs && docker compose up

down:
	cd srcs && docker compose down
