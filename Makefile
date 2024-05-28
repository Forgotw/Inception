NAME = inception
COMPOSE_ARGS = -f srcs/docker-compose.yml -p ${NAME}

all: install
	docker compose ${COMPOSE_ARGS} up -d --build
	@$(MAKE) status

install:
	mkdir -p /home/lsohler/data/www
	mkdir -p /home/lsohler/data/database
	cp ../.env srcs/

status:
	docker compose ${COMPOSE_ARGS} ps -a

logs:
	docker compose ${COMPOSE_ARGS} logs -f

nginx:
	docker exec -it nginx bash

mariadb:
	docker exec -it mariadb bash

wordpress:
	docker exec -it wordpress bash

fclean:
	docker compose ${COMPOSE_ARGS} stop
	docker compose ${COMPOSE_ARGS} down
	docker volume rm inception_www
	docker volume rm inception_database
	docker system prune -f
	rm -f srcs/.env

re: fclean all

.PHONY: all fclean re status logs nginx mariadb wordpress