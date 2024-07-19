#!/bin/bash

#---------------------------------------------------wp installation---------------------------------------------------#
sleep 10
cd /var/www/html;
#---------------------------------------------------wp installation---------------------------------------------------##---------------------------------------------------wp installation---------------------------------------------------#
wp core download --allow-root
wp config create --dbname=$MYSQL_DB --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$DB_HOST --allow-root
wp config set DB_HOST mariadb:3306 --allow-root
wp config set DB_NAME $MYSQL_DB --allow-root
wp config set DB_USER $MYSQL_USER --allow-root
wp config set DB_PASSWORD $MYSQL_PASSWORD --allow-root

# install wordpress with the given title, admin username, password and email
wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_N --admin_password=$WP_ADMIN_P --admin_email=$WP_ADMIN_E --allow-root
#create a new user with the given username, email, password and role
wp user create $WP_U_NAME $WP_U_EMAIL --user_pass=$WP_U_PASS --role=$WP_U_ROLE --allow-root

#---------------------------------------------------php config---------------------------------------------------#
sed -i '36 s@/run/php/php7.4-fpm.sock@9000@' /etc/php/7.4/fpm/pool.d/www.conf
mkdir -p /run/php
/usr/sbin/php-fpm7.4 -F