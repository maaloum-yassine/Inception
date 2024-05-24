#!/bin/sh


if [ -f "/etc/init.d/mysql" ] || [ -f "/etc/init.d/mariadb" ]
then
    echo "MariaDB est déjà installé sur ce système."
    exit 0  # Quitter le script avec un code de sortie 0 (aucune erreur)
fi



apt-get -y update && apt-get -y install mariadb-server
sed -i "s|bind-address            = 127.0.0.1|bind-address            = 0.0.0.0|g" /etc/mysql/mariadb.conf.d/50-server.cnf

if [ ! -d "/run/mysqld" ]; then
        mkdir /run/mysqld;
fi


service mariadb stop

# service --status-all

# DB_NAME=$(cat $MYSQL_DATABASE)
# DB_USER=$(cat $MYSQL_USER)
# DB_PASSWORD=$(cat $MYSQL_PASSWORD)
# DB_ROOT_PASSWORD=$(cat $MYSQL_ROOT_PASSWORD)




cat << EOF > /tmp/wp.sql
        FLUSH PRIVILEGES;
        CREATE DATABASE IF NOT EXISTS ${DB_NAME};
        CREATE USER IF NOT EXISTS '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASSWORD}';
        GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';
        FLUSH PRIVILEGES;
        ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';
EOF


mariadbd --user=root --bootstrap < /tmp/wp.sql;
rm -f /tmp/wp.sql;




cat << EOF >> /root/.bashrc
        alias root='mariadb --user=root -p'
        alias user='mariadb --user=$DB_USER -p'
EOF

source /root/.bashrc

mariadbd --user=root
