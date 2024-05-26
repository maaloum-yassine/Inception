FROM 		debian:bookworm

RUN			apt-get -y update && apt-get -y install mariadb-server

RUN			sed -i "s|bind-address            = 127.0.0.1|bind-address            = 0.0.0.0|g" /etc/mysql/mariadb.conf.d/50-server.cnf

COPY		./tools/mariadb_setup.sh /tmp/mariadb_setup.sh

RUN			chmod +x /tmp/mariadb_setup.sh

EXPOSE		3306

ENTRYPOINT	["/bin/bash", "/tmp/mariadb_setup.sh"]

CMD ["mariadbd", "--user=root"]
