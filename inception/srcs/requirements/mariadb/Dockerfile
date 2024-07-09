# version of os penultimate (debian)
FROM debian:bullseye

# update && upgrade packages
RUN apt-get update && apt-get upgrade -y

#install nano
RUN apt-get install nano -y

# install MariaDB
RUN apt-get install -y mariadb-server

#copy mariadb config file
COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

#copy mariadb start script
COPY tools/script.sh /script.sh

#change the permission of the script
RUN chmod 777 /script.sh

CMD ["/script.sh"]