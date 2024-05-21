#!/bin/sh

cd /var/www/html/wordpress

DB_NAME=$(cat $MYSQL_DATABASE)
DB_USER=$(cat $MYSQL_USER)
DB_PASSWORD=$(cat $MYSQL_PASSWORD)
DB_HOST=$(cat $LOCALHOST)
ADMIN_WP=$(cat $ADMIN_WP)
ADMIN_PASSWORD_WP=$(cat $ADMIN_PASSWORD_WP)
ADMIN_EMAIL_WP=$(cat $ADMIN_EMAIL_WP)
USER_EMAIL_WP=$(cat $USER_EMAIL_WP)
USER_PASSWORD_WP=$(cat $USER_PASSWORD_WP)

if ! wp --allow-root core is-installed; then
	wp		core download	--allow-root;
	rm 		-rf wp-config-sample.php
	sed 	-i "s/define( 'DB_NAME', XXXX );/define( 'DB_NAME', '${DB_NAME}' );/" wp-config.php
	sed 	-i "s/define( 'DB_USER', XXXX );/define( 'DB_USER', '${DB_USER}' );/" wp-config.php
	sed 	-i "s/define( 'DB_PASSWORD', XXXX );/define( 'DB_PASSWORD', '${DB_PASSWORD}' );/" wp-config.php
	sed 	-i "s/define( 'DB_HOST', XXXX );/define( 'DB_HOST', '${DB_HOST}' );/" wp-config.php
fi

wp core install --allow-root --url=${URL_WP} --title=${TITLE}  --admin_user=${ADMIN_WP} --admin_password=${ADMIN_PASSWORD_WP} --admin_email=${ADMIN_EMAIL_WP}
wp user create --allow-root ${USER_WP}  ${USER_EMAIL_WP} --role=editor --user_pass=${USER_PASSWORD_WP}

rm -rf /tmp/script.sh



php-fpm8.2 -F
