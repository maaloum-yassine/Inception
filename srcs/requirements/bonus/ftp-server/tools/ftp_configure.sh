# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ftp_configure.sh                                   :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ymaaloum <ymaaloum@student.1337.ma>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/27 07:31:55 by ymaaloum          #+#    #+#              #
#    Updated: 2024/05/29 17:01:52 by ymaaloum         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh


if [ ! -f "/etc/vsftpd.conf" ]; then

	chown nobody:nogroup /var/www/html/ftp
	FTP_USER=$(cat $FTP_USER)
	FTP_PWD=$(cat $FTP_PASSWORD)

	mv /etc/new_vsftpd.conf  /etc/vsftpd.conf
	service vsftpd start
	adduser $FTP_USER --disabled-password
	echo "$FTP_USER:$FTP_PWD" | chpasswd
	# getent passwd $FTP_USER
	echo "$FTP_USER" >> /etc/vsftpd.userlist
	mkdir -p /var/www/html/ftp
	chmod a-w /var/www/html/ftp
	chown $FTP_USER:$FTP_USER /var/www/html/ftp
	#sleep 80;
	#chmod -R 767 /var/www/html/ftp
fi

service vsftpd stop
exec "$@"
