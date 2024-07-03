all: up

up:
	docker-compose -f srcs/docker-compose.yml up --build

down:
	docker-compose -f srcs/docker-compose.yml down

stop:
	docker-compose -f srcs/docker-compose.yml stop

clean:
	@docker system prune -af > /dev/null
start:
	docker-compose -f srcs/docker-compose.yml start

status:
	docker-compose -f srcs/docker-compose.yml ps

re: down up