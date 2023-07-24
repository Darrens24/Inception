<?php

// define('DB_NAME', getenv('MYSQL_DB'));
// define('DB_USER', getenv('MYSQL_USR'));
// define('DB_PASSWORD', getenv('MYSQL_PSSWD'));
define('DB_HOST', 'mariadb');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

define('FS_METHOD','direct');

define('WP_SITEURL', 'localhost');
define('WP_HOME', 'localhost');
define('WP_ALLOW_REPAIR', 'true');
define('WP_DEBUG', true);


define('AUTH_KEY',         'M0m=OB(tS;C*+to<LtlTe:aOOoXV,Pi4NCq(.?*I*%B(B5(aDJ-pM|`T0GIQ:rr0');
define('SECURE_AUTH_KEY',  '<lL9,-/zobrSRZBp6CbYb}*b 5(soDE]@n{U$q*:Xc)mJ#aZ4Cc*h-njoD#)G]`h');
define('LOGGED_IN_KEY',    '|%lGV}u2J|p;tB&ljO!dIXH_XI24^uH%N<&,,/Hsz60;Xu+RzN9*KxsKwMZ9m(ug');
define('NONCE_KEY',        '-m+N(tv2CX[nGZ 76<~ci~J6~<4DA[Mv[MRXmg},7|Eh:5vvh{A+(PC#QCFhPw (');
define('AUTH_SALT',        '*h^Ui>eO[Ybl[5w:*6T8h;x()%3d@W3h:EF*^K2 qQr]M+7`u-Ho[A((g%XP-A!S');
define('SECURE_AUTH_SALT', '=?(H}N!%sq%MG)H02s!RUss-pV[f.e--} /^1EK4^cQzn_cHh+4(W@eV1K-?SPR1');
define('LOGGED_IN_SALT',   '<)xMG)m,wrx|!x:OUHM.D>0|`D4(W-0 GqA]6oNyE+rX@9|E7lDUgN~3bPwHDS<;');
define('NONCE_SALT',       'LtL9[yS}iyzrkM/+=+dJh;pgb2BJ#]R`9jqqp5bRZ +3-_y&L4U~XZ$)GzR_x!UV');

$table_prefix  = 'wp_';

if ( ! defined('ABSPATH')) {
	define('ABSPATH', __DIR__ . '/');
}

define( 'WP_REDIS_HOST', 'redis' );
define( 'WP_REDIS_PORT', 6379 );
define( 'WP_REDIS_TIMEOUT', 1 );
define( 'WP_REDIS_READ_TIMEOUT', 1 );
define( 'WP_REDIS_DATABASE', 0 );
require_once ABSPATH . 'wp-settings.php';
