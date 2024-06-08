FROM 		debian:buster

RUN 		apt-get -y update && apt install redis-server -y

COPY		./tools/redis_configure.sh /tmp/redis_configure.sh

RUN 		chmod +x /tmp/redis_configure.sh

EXPOSE 		6379

ENTRYPOINT ["bash", "/tmp/redis_configure.sh"]

CMD ["redis-server","--protected-mode","no"]
