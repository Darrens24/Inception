#!/bin/sh

sleep 10

if [ ! -f "/var/www/html/wp-config.php" ]; then
    wp config create --allow-root \
      --dbname=$MYSQL_DB --dbuser=$MYSQL_USR --dbpass=$MYSQL_PSSWD --dbhost=$MYSQL_HOSTNAME:3306 --path='/var/www/wordpress'

    wp core install \
    --title="$WP_TITLE" \
        --admin_user="$WP_ADMIN" \
        --admin_password="$WP_ADMIN_PSSWD" \
        --admin_email="$WP_ADMIN_MAIL" \
        --url="$DOMAIN_NAME"

     wp user create \
        "$WP_USR" \
        "$WP_MAIL" \
        --user_pass="$WP_PSSWD"
fi
