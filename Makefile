all: build

build:
	mkdir -p /home/${USER}/data/mariadb
	mkdir -p /home/${USER}/data/wordpress
	cd srcs && docker compose up --build

clean:
	cd srcs && docker compose down --volumes --rmi all
	docker container prune -f
	docker image prune -af
	docker volume prune -f
	rm -rf /home/${USER}/data

re: clean all

up:
	cd srcs && docker compose up

down:
	cd srcs && docker compose down
