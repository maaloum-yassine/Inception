#!bin/sh


# sed -i "s|bind-address            = 127.0.0.1|bind-address            = 0.0.0.0|g" /etc/mysql/mariadb.conf.d/50-server.cnf


# service mariadb restart

# ss -utln

service mariadb stop

service --status-all

if [ ! -d "/run/mysqld" ]; then
	mkdir /run/mysqld;
fi


cat << EOF > /tmp/wp.sql
	FLUSH PRIVILEGES;
	CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
	CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';
	GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
	FLUSH PRIVILEGES;
	ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
EOF


mariadbd --user=root --bootstrap < /tmp/wp.sql;
rm -f /tmp/wp.sql;



cat << EOF >> /root/.bashrc
	alias root='mariadb --user=root -p'
	alias user='mariadb --user=$MYSQL_USER -p'
EOF

source /root/.bashrc



exec "$@"
# mariadbd --user=root
