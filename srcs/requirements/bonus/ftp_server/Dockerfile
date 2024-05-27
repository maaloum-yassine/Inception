FROM 	debian:buster

RUN 	apt update -y

RUN 	apt install vsftpd -y

COPY 	./tools/ftp_configure.sh /tmp/ftp_configure.sh

RUN		chomd +x /tmp/ftp_configure.sh

ENTRYPOINT ["bash", "/tmp/ftp_configure.sh"]

CMD [""]
