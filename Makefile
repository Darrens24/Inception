all:
	docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	docker-compose -f ./srcs/docker-compose.yml down

clean:
	docker-compose -f ./srcs/docker-compose.yml down --rmi all --volumes --remove-orphans

fclean: clean
	docker system prune -a --volumes

re: fclean all
