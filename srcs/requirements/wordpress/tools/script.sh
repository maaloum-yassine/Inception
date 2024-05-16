#!/bin/sh

cd /var/www/html/wordpress


# sed -i "s/define( 'DB_NAME', XXXX );/define( 'DB_NAME', '${MYSQL_DATABASE}' );/" wp-config.php
# sed -i "s/define( 'DB_USER', XXXX );/define( 'DB_USER', '${MYSQL_USER}' );/" wp-config.php
# sed -i "s/define( 'DB_PASSWORD', XXXX );/define( 'DB_PASSWORD', '${MYSQL_PASSWORD}' );/" wp-config.php
# sed -i "s/define( 'DB_HOST', XXXX );/define( 'DB_HOST', '${LOCALHOST}' );/" wp-config.php


wp core download	--allow-root; # download core files
wp config create	--allow-root --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=mariadb:3306; # create the config file of wordpress that contain database info
wp core install		--allow-root --url=${URL_WP} --title=${TITLE} --admin_user=${ADMIN_WP} --admin_password=${WP_ADMIN_PASSWD} --admin_email=${ADMIN_EMAIL_WP}; # create new wordpress website


wp core install --allow-root --url=${URL_WP} --title=${TITLE}  --admin_user=${ADMIN_WP} --admin_password=${ADMIN_PASSWORD_WP} --admin_email=${ADMIN_EMAIL_WP}
wp user create --allow-root ${USER_WP}  ${USER_EMAIL_WP} --role=editor --user_pass=${USER_PASSWORD_WP}

# rm -rf /tmp/script.sh

exec "$@"

# php-fpm8.2 -F
