FROM alpine:3.16.7

###   on alpine systemctl doesn't exist so we need openrc   ###

RUN apk update && apk upgrade && apk add mariadb \
  mariadb-client mariadb-common \
  mariadb-server-utils openrc 

COPY conf/mariadb.conf /etc/mysql/my.cnf
COPY conf/mariadb.conf /etc/my.cnf
COPY conf/mariadb.conf ~/my.cnf

RUN	mkdir -p /run/mysqld \
  && mkdir -p /var/lib/mysql \
  && chmod 777 /var/lib/mysql && chmod 777 /run/mysqld


COPY tools/mariadb-setup.sh /tmp/mariadb-setup.sh

EXPOSE 3306

ENTRYPOINT	["sh", "/tmp/mariadb-setup.sh"]
