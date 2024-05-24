FROM	debian:buster

RUN		apt upgrade

RUN		apt-get update && apt-get install -y nginx openssl

RUN		apt-get install curl -y

COPY	./tools/script.sh /tmp/

RUN		chmod +x /tmp/script.sh && /tmp/script.sh

RUN		rm -rf /etc/nginx/sites-enabled/default && rm -rf /etc/nginx/sites-available/default

COPY	./conf/config_wordpress /etc/nginx/sites-available

COPY	./conf/config_adminer /etc/nginx/sites-available

COPY	./conf/config_anon  /etc/nginx/sites-available

RUN 	ln -s	/etc/nginx/sites-available/config_wordpress  /etc/nginx/sites-enabled/config_wordpress \
		&& ln -s	/etc/nginx/sites-available/config_adminer  /etc/nginx/sites-enabled/config_adminer \
		&& ln -s	/etc/nginx/sites-available/config_anon  /etc/nginx/sites-enabled/config_anon

EXPOSE	443

CMD ["nginx", "-g", "daemon off;"]
