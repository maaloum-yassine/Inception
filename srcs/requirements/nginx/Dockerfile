FROM	debian:buster

RUN		apt upgrade

RUN		apt-get update && apt-get install -y nginx openssl

RUN		apt-get install curl -y

COPY	./tools/script.sh /tmp/

RUN		chmod +x /tmp/script.sh && /tmp/script.sh

RUN		rm -rf /etc/nginx/sites-enabled/default

COPY	./conf/config_wordpress /etc/nginx/sites-enabled

COPY	./conf/config_adminer /etc/nginx/sites-enabled

COPY	./conf/config_anon  /etc/nginx/sites-enabled

EXPOSE	443

CMD ["nginx", "-g", "daemon off;"]
