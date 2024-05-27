NAME = inception
COMPOSE_ARGS = -f srcs/docker-compose.yml -p ${NAME}

all:
	mkdir -p /home/lsohler/data/www
	mkdir -p /home/lsohler/data/database
	docker compose ${COMPOSE_ARGS} up -d --build
	@$(MAKE) status

status:
	docker compose ${COMPOSE_ARGS} ps -a

logs:
	docker compose ${COMPOSE_ARGS} logs -f

fclean:
	docker compose ${COMPOSE_ARGS} stop
	docker compose ${COMPOSE_ARGS} down
	docker volume rm inception_www
	docker system prune -f

re: fclean all

.PHONY: all fclean re status