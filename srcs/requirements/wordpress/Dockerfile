FROM	debian:bookworm

RUN		apt update && apt install -y wget iproute2 php8.2 php8.2-fpm php8.2-mysql mariadb-client telnet iputils-ping

RUN		apt upgrade -y

RUN		mkdir -p /var/www/html/wordpress

RUN		chmod 777 /var/www/html/wordpress

RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod 777 wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN		sed -i "s|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/8.2/fpm/pool.d/www.conf


# RUN		cd /var/www/html/wordpress && wp core download --allow-root && rm -rf wp-config-sample.php


# RUN		cd /var/www/html/wordpress && wp core download --allow-root
# && rm -rf wp-config-sample.php
# COPY	./conf/wp-config.php  /var/www/html/wordpress

COPY	./tools/script.sh /tmp/script.sh

RUN 	chmod +x /tmp/script.sh

EXPOSE		9000

ENTRYPOINT ["bash", "/tmp/script.sh"]


CMD ["php-fpm8.2", "-F"]
