#!/bin/sh

###     for redis, adding debug and configurations  l21    ###

if [ ! -f "/var/www/wp-config.php" ]; then
    cat << EOF > /var/www/wp-config.php
<?php
define( 'DB_NAME', '$MYSQL_DB');
define( 'DB_USER', '$MYSQL_USR');
define( 'DB_PASSWORD', '$MYSQL_PSSWD');
define( 'DB_HOST', 'mariadb' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );
define('FS_METHOD','direct');
\$table_prefix = 'wp_';

define( 'WP_DEBUG', true );
define( 'WP_DEBUG_LOG', true );
define( 'WP_DEBUG_DISPLAY', false );

if ( ! defined( 'ABSPATH' ) ) {
define( 'ABSPATH', __DIR__ . '/' );}
define( 'WP_REDIS_HOST', 'redis' );
define( 'WP_REDIS_PORT', 6379 );
define( 'WP_REDIS_TIMEOUT', 1 );
define( 'WP_REDIS_READ_TIMEOUT', 1 );
define( 'WP_REDIS_DATABASE', 0 );
require_once (ABSPATH . 'wp-settings.php');
EOF
fi

php-fpm8 -F

# wget 	https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# chmod 	+x wp-cli.phar
# mv wp-cli.phar /usr/local/bin/wp 

# wp core install --allow-root \
#        		--url="localhost" \
# 		--title=${WP_TITLE} \
# 		--admin_user=${WP_ADMIN} \
# 		--admin_password=${WP_ADMIN_PSSWD} \
# 		--admin_email="${WP_ADMIN_MAIL}" \
# 		--path="/var/www/wordpress"
#
#
# wp user create ${WP_USR} "${WP_MAIL}" \
# 		--user_pass=${WP_PSSWD} \
# 		--role=author \
# 		--allow-root

