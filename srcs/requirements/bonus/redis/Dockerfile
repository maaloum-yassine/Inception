FROM debian:buster

RUN apt-get -y update && apt install redis-server -y

COPY	./tools/redis_setup.sh /tmp/redis_setup.sh

RUN 	chmod +x /tmp/redis_setup.sh

EXPOSE 		6379

ENTRYPOINT ["bash", "/tmp/redis_setup.sh"]

CMD ["redis-server","--protected-mode","no"]
