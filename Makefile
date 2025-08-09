all: build

build:
	mkdir -p /home/relamine/data/mariadb
	mkdir -p /home/relamine/data/wordpress
	mkdir -p /home/relamine/data/portainer
	cd srcs && docker compose up -d --build

clean:
	cd srcs && docker compose down --volumes --rmi all
	docker container prune -f
	docker image prune -af
	docker volume prune -f
	sudo rm -rf /home/relamine/data

fclean: clean
	docker system prune -af --volumes

re: clean all

up:
	cd srcs && docker compose up

down:
	cd srcs && docker compose down
