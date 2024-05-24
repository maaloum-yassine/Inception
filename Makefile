# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ymaaloum <ymaaloum@student.1337.ma>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/10 14:33:45 by ymaaloum          #+#    #+#              #
#    Updated: 2024/05/24 03:42:51 by ymaaloum         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all : up

up :
	mkdir -p /home/${USER}/data/mariadb
	mkdir -p /home/${USER}/data/wordpress
	mkdir -p /home/${USER}/data/adminer
	mkdir -p /home/${USER}/data/anon
	docker-compose -f ./srcs/docker-compose.yml up

down :
	@docker-compose -f ./srcs/docker-compose.yml down -v --rmi all

stop :
	@docker-compose -f ./srcs/docker-compose.yml stop

start :
	mkdir -p /home/${USER}/data/mariadb
	mkdir -p /home/${USER}/data/wordpress
	mkdir -p /home/${USER}/data/adminer
	mkdir -p /home/${USER}/data/anon
	@docker-compose -f ./srcs/docker-compose.yml start  || true

status :
	@docker ps -a | grep "ym_mariadb\|ym_wordpress\|ym_nginx\|ym_adminer\|ym_cadvisor\|ym_anon"	|| true


