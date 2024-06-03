# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ymaaloum <ymaaloum@student.1337.ma>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/10 14:33:45 by ymaaloum          #+#    #+#              #
#    Updated: 2024/06/03 17:01:42 by ymaaloum         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all : up

up :
	mkdir -p /home/${USER}/data/mariadb
	mkdir -p /home/${USER}/data/wordpress
	mkdir -p /home/${USER}/data/adminer
	mkdir -p /home/${USER}/data/anon
	docker-compose -f ./srcs/docker-compose.yml up --build

down :
	@docker-compose -f ./srcs/docker-compose.yml down -v --rmi all

stop :
	@docker-compose -f ./srcs/docker-compose.yml stop

start :
	@docker-compose -f ./srcs/docker-compose.yml start  || true

status :
	@docker ps -a | grep "mariadb\|wordpress\|nginx\|adminer\|cadvisor\|anon\|redis\|ftp-server"	|| true

