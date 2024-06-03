FROM	debian:buster

RUN		apt upgrade

RUN		apt-get update && apt-get install -y nginx openssl

RUN		apt-get install curl -y

COPY	./tools/nginx_configure.sh /tmp/

RUN		chmod +x /tmp/nginx_configure.sh && /tmp/nginx_configure.sh

RUN		rm -rf /etc/nginx/sites-enabled/default && rm -rf /etc/nginx/sites-available/default \
		&& rm -rf /tmp/nginx_configure.sh

COPY	./conf/config_A_wordpress /etc/nginx/sites-available

COPY	./conf/config_B_anon  /etc/nginx/sites-available

COPY	./conf/config_C_adminer /etc/nginx/sites-available


RUN 	ln -s	/etc/nginx/sites-available/config_A_wordpress  /etc/nginx/sites-enabled/config_A_wordpress \
		&& ln -s	/etc/nginx/sites-available/config_B_anon  /etc/nginx/sites-enabled/config_B_anon \
		&& ln -s	/etc/nginx/sites-available/config_C_adminer  /etc/nginx/sites-enabled/config_C_adminer

EXPOSE	443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
