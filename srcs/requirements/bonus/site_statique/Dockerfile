FROM 	debian:buster

RUN 	apt update -y

RUN 	apt install nodejs npm -y

COPY 	tools /var/www/html/

WORKDIR /var/www/html/

RUN npm init -y && npm install express -y

CMD ["node", "run_server.js"]
