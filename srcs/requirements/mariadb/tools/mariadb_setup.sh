# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    script.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ymaaloum <ymaaloum@student.1337.ma>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/26 09:30:01 by ymaaloum          #+#    #+#              #
#    Updated: 2024/05/26 10:05:40 by ymaaloum         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh


DB_NAME=$(cat $MYSQL_DATABASE)

if [ ! -d "/var/lib/mysql/$DB_NAME" ]; then

	DB_USER=$(cat $MYSQL_USER)
	DB_PASSWORD=$(cat $MYSQL_PASSWORD)
	DB_ROOT_PASSWORD=$(cat $MYSQL_ROOT_PASSWORD)

	if [ ! -d "/run/mysqld" ]; then
	        mkdir /run/mysqld;
	fi


	service mariadb stop

	# service --status-all

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
fi

echo "La base de données $DB_NAME existe. Démarrage de MariaDB..."
exec "$@"
