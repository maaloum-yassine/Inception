FROM	debian:bookworm

RUN		apt update -y && apt install -y wget iproute2 php8.2 php8.2-fpm php8.2-mysql mariadb-client telnet iputils-ping

RUN		apt upgrade -y

RUN		mkdir -p /var/www/html/wordpress && chmod -R 755 /var/www/html/wordpress

RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod 777 wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN		sed -i "s|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/8.2/fpm/pool.d/www.conf

COPY	./conf/wp-config.php  /var/www/html/wordpress

COPY	./tools/wordpress_setup.sh /tmp/wordpress_setup.sh

RUN 		chmod +x /tmp/wordpress_setup.sh

EXPOSE		9000

ENTRYPOINT ["bash", "/tmp/wordpress_setup.sh"]

CMD ["php-fpm8.2", "-F"]
