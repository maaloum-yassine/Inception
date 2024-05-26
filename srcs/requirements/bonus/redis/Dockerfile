FROM debian:buster

RUN apt-get -y update && apt install redis-server -y

COPY	./tools/script.sh /tmp/script.sh

RUN 	chmod +x /tmp/script.sh

EXPOSE 		6379

ENTRYPOINT ["bash", "/tmp/script.sh"]

# CMD ["redis-server","--protected-mode","no"]
