WP_DIR = /home/aben-nei/data/wordpressVM/
DB_DIR = /home/aben-nei/data/mariadbVM/

all: create_dir up

create_dir:
	@mkdir -p $(WP_DIR)
	@mkdir -p $(DB_DIR)

up:
	docker-compose -f srcs/docker-compose.yml up --build

down:
	docker-compose -f srcs/docker-compose.yml down

stop:
	docker-compose -f srcs/docker-compose.yml stop

clean: down
	@docker system prune -af > /dev/null
	@rm -rf $(WP_DIR)
	@rm -rf $(DB_DIR)
start:
	docker-compose -f srcs/docker-compose.yml start

status:
	docker-compose -f srcs/docker-compose.yml ps
vm:
	@rm -rf /home/aben-nei/data/wordpressVM/*

re: clean create_dir up