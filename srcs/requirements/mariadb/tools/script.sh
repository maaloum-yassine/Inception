#!bin/sh

# service mariadb restart

# ss -utln

service mariadb stop

# service --status-all

DB_NAME=$(cat $MYSQL_DATABASE)
DB_USER=$(cat $MYSQL_USER)
DB_PASSWORD=$(cat $MYSQL_PASSWORD)
DB_ROOT_PASSWORD=$(cat $MYSQL_ROOT_PASSWORD)


if [ ! -d "/run/mysqld" ]; then
	mkdir /run/mysqld;
fi


cat << EOF > /tmp/wp.sql
	FLUSH PRIVILEGES;
	CREATE DATABASE IF NOT EXISTS ${DB_NAME};
	CREATE USER IF NOT EXISTS '${DB_USER}'@'localhost' IDENTIFIED BY '${USER_PASSWORD}';
	GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';
	FLUSH PRIVILEGES;
	ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PASSWORD}';
EOF


mariadbd --user=root --bootstrap < /tmp/wp.sql;
rm -f /tmp/wp.sql;



cat << EOF >> /root/.bashrc
	alias root='mariadb --user=root -p'
	alias user='mariadb --user=$DB_USER -p'
EOF

source /root/.bashrc


mariadbd --user=root
