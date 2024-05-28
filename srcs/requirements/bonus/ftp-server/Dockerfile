FROM 	debian:buster

RUN 	apt update -y

RUN 	apt install vsftpd -y

RUN 	rm -rf /etc/vsftpd.conf

COPY	./conf/new_vsftpd.conf  /etc/

COPY 	./tools/ftp_configure.sh /tmp/ftp_configure.sh

RUN		chmod +x /tmp/ftp_configure.sh  && chmod 644 /etc/new_vsftpd.conf

ENTRYPOINT ["bash", "/tmp/ftp_configure.sh"]

CMD ["/usr/sbin/vsftpd"]
