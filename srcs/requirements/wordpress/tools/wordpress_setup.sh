# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    wordpress_setup.sh                                 :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ymaaloum <ymaaloum@student.1337.ma>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/26 10:08:19 by ymaaloum          #+#    #+#              #
#    Updated: 2024/05/26 10:18:53 by ymaaloum         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh


cd /var/www/html/wordpress

if ! wp --allow-root core is-installed; then

	DB_NAME=$(cat $MYSQL_DATABASE)
	DB_USER=$(cat $MYSQL_USER)
	DB_PASSWORD=$(cat $MYSQL_PASSWORD)
	DB_HOST=$(cat $LOCALHOST)
	ADMIN_WP=$(cat $ADMIN_WP)
	ADMIN_PASSWORD_WP=$(cat $ADMIN_PASSWORD_WP)
	ADMIN_EMAIL_WP=$(cat $ADMIN_EMAIL_WP)
	USER_EMAIL_WP=$(cat $USER_EMAIL_WP)
	USER_PASSWORD_WP=$(cat $USER_PASSWORD_WP)
	REDIS_HOST=$(cat $WP_REDIS_HOST)
	REDIS_PORT=$(cat $WP_REDIS_PORT)
	wp		core download	--allow-root;
	rm 		-rf wp-config-sample.php
	sed 	-i "s/define( 'DB_NAME', XXXX );/define( 'DB_NAME', '${DB_NAME}' );/" wp-config.php
	sed 	-i "s/define( 'DB_USER', XXXX );/define( 'DB_USER', '${DB_USER}' );/" wp-config.php
	sed 	-i "s/define( 'DB_PASSWORD', XXXX );/define( 'DB_PASSWORD', '${DB_PASSWORD}' );/" wp-config.php
	sed 	-i "s/define( 'DB_HOST', XXXX );/define( 'DB_HOST', '${DB_HOST}' );/" wp-config.php
	sed 	-i "s/define( 'WP_REDIS_HOST', XXXX );/define( 'WP_REDIS_HOST', '${REDIS_HOST}' );/" wp-config.php
	sed 	-i "s/define( 'WP_REDIS_PORT', XXXX );/define( 'DB_HOST', ${REDIS_PORT} );/" wp-config.php

	wp core install --allow-root --url=${URL_WP} --title=${TITLE}  --admin_user=${ADMIN_WP} --admin_password=${ADMIN_PASSWORD_WP} --admin_email=${ADMIN_EMAIL_WP}
	wp user create --allow-root ${USER_WP}  ${USER_EMAIL_WP} --role=editor --user_pass=${USER_PASSWORD_WP}
	wp theme install astra --activate --allow-root

	wp plugin install redis-cache --activate --allow-root
	wp plugin update --all --allow-root
	wp redis enable --allow-root
	chown -R www-data:www-data /var/www/html/wordpress/

fi

exec "$@"
