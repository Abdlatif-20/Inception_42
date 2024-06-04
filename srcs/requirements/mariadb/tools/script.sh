#!/bin/sh
# service mysql start; # Start mysql service
# mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;" # Create database if not exists
# mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';" # Create user if not exists
# mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';" # Grant all privileges to user
# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';" # Change root password
# mysql -e "FLUSH PRIVILEGES;" # Flush privileges
# mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown # Shutdown mysql service
# exec mysqld_safe # Start mysql service


# Database name
MYSQL_DB="wordpress"

# Username for the new user
MYSQL_USER="aben-nei"

# Password for the new user
MYSQL_PASSWORD="pass123"

# New password for the MySQL root user
MYSQL_ROOT_PASSWORD="root123"

#--------------mariadb start--------------#
service mariadb start # start mariadb
sleep 3 # wait for mariadb to start

#--------------mariadb config--------------#
# Create database if not exists
mariadb -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DB}\`;"

# Create user if not exists
mariadb -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

# Grant privileges to user
mariadb -e "GRANT ALL PRIVILEGES ON ${MYSQL_DB}.* TO \`${MYSQL_USER}\`@'%';"

# Flush privileges to apply changes
mariadb -e "FLUSH PRIVILEGES;"

#--------------mariadb restart--------------#
# Shutdown mariadb to restart with new config
mysqladmin -u root shutdown

# Restart mariadb with new config in the background to keep the container running
mysqld_safe --port=3306 --bind-address=0.0.0.0 --datadir='/var/lib/mysql'