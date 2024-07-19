WP_DIR = /home/aben-nei/data/wordpressVM/
DB_DIR = /home/aben-nei/data/mariadbVM/

all: create_dir up

create_dir:
	@sudo mkdir -p $(WP_DIR)
	@sudo mkdir -p $(DB_DIR)

up:
	sudo docker-compose -f srcs/docker-compose.yml up --build

down:
	sudo docker-compose -f srcs/docker-compose.yml down

stop:
	sudo docker-compose -f srcs/docker-compose.yml stop

clean: down
	@sudo docker system prune -af > /dev/null
	@sudo rm -rf $(WP_DIR)
	@sudo rm -rf $(DB_DIR)
start:
	sudo docker-compose -f srcs/docker-compose.yml start

status:
	sudo docker-compose -f srcs/docker-compose.yml ps
vm:
	@sudo rm -rf /home/aben-nei/data/wordpressVM/*

re: clean create_dir up