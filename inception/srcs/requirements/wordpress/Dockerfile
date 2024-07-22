# pull the base image
FROM debian:bullseye

# update and upgrade the system
RUN apt-get update && apt-get upgrade -y

# install the required packages
RUN apt-get install curl php php7.4-fpm php-mysql -y


RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# copy the wordpress configuration script to the root directory in the container
COPY tools/wp_conf.sh /

# change the permission of the script to make it executable
RUN  chmod +x wp_conf.sh

# define the entrypoint command to run when the container starts
CMD ["./wp_conf.sh"]