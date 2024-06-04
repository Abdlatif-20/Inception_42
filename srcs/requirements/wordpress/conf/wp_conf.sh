#!/bin/bash

MYSQL_DB=wordpress
MYSQL_USER=aben-nei
MYSQL_PASSWORD=pass123
DB_HOST=mariadb
WP_TITLE=INCEPTION_OF_THINGS
WP_ADMIN_N=admin
WP_ADMIN_P=admin
WP_ADMIN_E=admin@gmail.com
WP_U_NAME=user
WP_U_EMAIL=user@gmail.com
WP_U_PASS=user
WP_U_ROLE=author
WP_URL=aben-nei.42.fr


#---------------------------------------------------wp installation---------------------------------------------------#
sleep 10
# wp-cli installation
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# wp-cli permission
# cp ./conf/www.conf /etc/php/7.4/fpm/pool.d/

chmod +x wp-cli.phar
# wp-cli move to bin
mv wp-cli.phar /usr/local/bin/wp

mkdir -p /var/www/html;

# go to wordpress directory
cd /var/www/html;
# give permission to wordpress directory
chmod -R 755 /var/www/html;
# change owner of wordpress directory to www-data
chown -R www-data:www-data /var/www/html;

#---------------------------------------------------wp installation---------------------------------------------------##---------------------------------------------------wp installation---------------------------------------------------#

# download wordpress core files
wp core download --allow-root
wp config create --dbname=$MYSQL_DB --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$DB_HOST --allow-root
# create wp-config.php file with database details
# mv wp-config-sample.php wp-config.php
# wp config set DB_HOST mariadb:3306 --allow-root
# wp config set DB_NAME $MYSQL_DB --allow-root
# wp config set DB_USER $MYSQL_USER --allow-root
# wp config set DB_PASSWORD $MYSQL_PASSWORD --allow-root

# install wordpress with the given title, admin username, password and email
wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_N --admin_password=$WP_ADMIN_P --admin_email=$WP_ADMIN_E --allow-root
#create a new user with the given username, email, password and role
wp user create $WP_U_NAME $WP_U_EMAIL --user_pass=$WP_U_PASS --role=$WP_U_ROLE --allow-root
#---------------------------------------------------php config---------------------------------------------------#

# change listen port from unix socket to 9000
# sed -i '36 s@/run/php/php7.4-fpm.sock@9000@' /etc/php/7.4/fpm/pool.d/www.conf
# create a directory for php-fpm
mkdir -p /run/php
# start php-fpm service in the foreground to keep the container running
/usr/sbin/php-fpm7.4 -F