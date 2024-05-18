# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ymaaloum <ymaaloum@student.1337.ma>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/10 14:33:45 by ymaaloum          #+#    #+#              #
#    Updated: 2024/05/17 00:48:43 by ymaaloum         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all : up

up :
	mkdir -p /home/${USER}/data/mariadb
	mkdir -p /home/${USER}/data/wordpress
	docker-compose -f ./srcs/docker-compose.yml up

down :
	@docker-compose -f ./srcs/docker-compose.yml down -v --rmi all

stop :
	@docker-compose -f ./srcs/docker-compose.yml stop

start :
	@docker-compose -f ./srcs/docker-compose.yml start  || true

status :
	@docker ps -a | grep -q "|ym_mariadb\|ym_wordpress\|ym_nginx" || true
