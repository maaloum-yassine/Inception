FROM	debian:buster

RUN		apt-get update && apt-get install curl -y

RUN curl -LO https://github.com/google/cadvisor/releases/download/v0.39.0/cadvisor \
	&& chmod +x cadvisor \
	&& mv cadvisor /usr/local/bin/

EXPOSE 8080

CMD ["cadvisor"]
