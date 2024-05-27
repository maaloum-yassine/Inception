FROM	debian:buster

RUN		apt update -y && apt install -y wget iproute2 php php-fpm php-mysql mariadb-client telnet iputils-ping


RUN		apt upgrade -y

RUN		mkdir -p /var/www/html/wordpress \
		&& chmod -R 755 /var/www/html/wordpress \
		&& mkdir -p /run/php

RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod 777 wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp


RUN		sed -i "s|listen = /run/php/php7.3-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/7.3/fpm/pool.d/www.conf

COPY	./conf/wp-config.php  /var/www/html/wordpress

COPY	./tools/wordpress_setup.sh /tmp/wordpress_setup.sh

RUN 		chmod +x /tmp/wordpress_setup.sh

EXPOSE		9000

ENTRYPOINT ["bash", "/tmp/wordpress_setup.sh"]


CMD ["/usr/sbin/php-fpm7.3", "-F"]
