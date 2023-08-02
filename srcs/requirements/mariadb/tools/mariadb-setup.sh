#!/bin/sh

#https://wiki.alpinelinux.org/wiki/MariaDB

chown -R mysql:mysql /var/lib/mysql
/usr/bin/mysql_install_db

###   without exec, it's a background process so we can kill it   ###

/usr/bin/mysqld &
while ! mysqladmin ping -hlocalhost --silent; do
  echo "MYSQL server preparing..."
  sleep 1
done

mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DB;"
mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USR'@'%' IDENTIFIED BY '$MYSQL_PSSWD';"
mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DB.* TO '$MYSQL_USR'@'%' IDENTIFIED BY '$MYSQL_PSSWD';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PSSWD';"
mysql -e "FLUSH PRIVILEGES;"

pkill mysqld

###   exec gives control the main process's control to mysqld  ###

exec /usr/bin/mysqld

