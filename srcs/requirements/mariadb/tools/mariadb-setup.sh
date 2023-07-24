#!/bin/sh

#https://wiki.alpinelinux.org/wiki/MariaDB

chown -R mysql:mysql /var/lib/mysql
/usr/bin/mysql_install_db
/usr/bin/mysqld & sleep 3

mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DB;"
mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USR'@'%' IDENTIFIED BY '$MYSQL_PSSWD';"
mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DB.* TO '$MYSQL_USR'@'%' IDENTIFIED BY '$MYSQL_PSSWD';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PSSWD';"
mysql -e "FLUSH PRIVILEGES;"

pkill mysqld
exec /usr/bin/mysqld
