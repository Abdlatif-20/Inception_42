#!/bin/bash

#---------------------------------------------------wp installation---------------------------------------------------#
sleep 10
cd /var/www/html;
# wp-cli installation
# curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# wp-cli permission
# cp ./conf/www.conf /etc/php/7.4/fpm/pool.d/

# chmod +x wp-cli.phar
# # wp-cli move to bin
# mv wp-cli.phar /usr/local/bin/wp

#---------------------------------------------------wp installation---------------------------------------------------##---------------------------------------------------wp installation---------------------------------------------------#

# download wordpress core files
wp core download --allow-root
# rm /var/www/html/wp-config.php
wp config create --dbname=$MYSQL_DB --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$DB_HOST --allow-root
# create wp-config.php file with database details
# mv var/www/html/wp-config-sample.php var/www/html/wp-config.php
wp config set DB_HOST mariadb:3306 --allow-root
wp config set DB_NAME $MYSQL_DB --allow-root
wp config set DB_USER $MYSQL_USER --allow-root
wp config set DB_PASSWORD $MYSQL_PASSWORD --allow-root

# install wordpress with the given title, admin username, password and email
wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_N --admin_password=$WP_ADMIN_P --admin_email=$WP_ADMIN_E --allow-root
#create a new user with the given username, email, password and role
wp user create $WP_U_NAME $WP_U_EMAIL --user_pass=$WP_U_PASS --role=$WP_U_ROLE --allow-root
#---------------------------------------------------redis configuration---------------------------------------------------#
#install redis-cache plugin
wp plugin install redis-cache --activate --allow-root
#select redis host
wp config set WP_REDIS_HOST redis --allow-root
#select redis port
wp config set WP_REDIS_PORT 6379 --allow-root

#---------------------------------------------------php config---------------------------------------------------#
# change listen port from unix socket to 9000
sed -i '36 s@/run/php/php7.4-fpm.sock@9000@' /etc/php/7.4/fpm/pool.d/www.conf
# create a directory for php-fpm
mkdir -p /run/php
# start php-fpm service in the foreground to keep the container running
/usr/sbin/php-fpm7.4 -F