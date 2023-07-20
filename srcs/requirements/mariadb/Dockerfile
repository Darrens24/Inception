FROM alpine:3.18.0

RUN apk update && apk upgrade && apk add mariadb \
  mariadb-client mariadb-common \
  mariadb-server-utils openrc 

COPY conf/mariadb.conf /etc/mysql/my.cnf
COPY conf/mariadb.conf /etc/my.cnf
COPY conf/mariadb.conf ~/my.cnf

RUN	mkdir -p /run/mysqld && mkdir -p /var/lib/mysql && chmod 777 /var/lib/mysql && chmod 777 /run/mysqld


COPY tools/mariadb-setup.sh /tmp/mariadb-setup.sh
EXPOSE 3306
# RUN			chmod +x /tmp/mariadb-setup.sh
ENTRYPOINT	["sh", "/tmp/mariadb-setup.sh"]

