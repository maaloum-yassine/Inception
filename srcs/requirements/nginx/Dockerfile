FROM	debian:buster

RUN		apt upgrade

RUN		apt-get update && apt-get install -y nginx openssl

RUN		apt-get install curl -y

COPY	./tools/script.sh /tmp/

RUN		chmod +x /tmp/script.sh && /tmp/script.sh

RUN		cd /etc/nginx/  && rm -rf /etc/nginx/default


COPY	./conf/default /etc/nginx/sites-enabled



EXPOSE	443


CMD ["nginx", "-g", "daemon off;"]
