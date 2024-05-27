FROM		debian:buster

RUN			apt-get -y update && apt-get -y install mariadb-server

RUN 		mkdir -p /var/run/mysqld \
			&& chown -R mysql:mysql /var/run/mysqld \
			&& chmod 777 /var/run/mysqld

RUN			sed -i "s|bind-address            = 127.0.0.1|bind-address            = 0.0.0.0|g" /etc/mysql/mariadb.conf.d/50-server.cnf

COPY		./tools/mariadb_configure.sh /tmp/mariadb_configure.sh

RUN			chmod +x /tmp/mariadb_configure.sh

EXPOSE		3306

ENTRYPOINT	["/bin/bash", "/tmp/mariadb_configure.sh"]


CMD ["mysqld"]
