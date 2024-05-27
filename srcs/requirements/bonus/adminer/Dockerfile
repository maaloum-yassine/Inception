FROM	debian:buster

RUN		apt update

RUN		apt install -y php php-fpm php-mysql

RUN		apt install -y adminer

RUN		mv /usr/share/adminer /var/www/html

RUN		chmod 655  /var/www/html/adminer && mkdir -p /run/php

RUN		sed -i "s|listen = /run/php/php7.3-fpm.sock|listen = 0.0.0.0:8080|g" /etc/php/7.3/fpm/pool.d/www.conf

EXPOSE	8081

CMD ["/usr/sbin/php-fpm7.3", "-F"]
