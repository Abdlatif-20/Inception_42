# pull the base image
FROM debian:bullseye

# update and upgrade the system
RUN apt-get update && apt-get upgrade -y

# install the required packages
RUN apt-get install -y wget php7.4-fpm php-mysql

RUN mkdir -p /var/www/html/adminer

# Download the latest version of Adminer
RUN wget -O /var/www/html/adminer/adminer.php "https://www.adminer.org/latest.php"

COPY tools/script.sh /

RUN chmod 777 /script.sh

CMD ["/script.sh"]