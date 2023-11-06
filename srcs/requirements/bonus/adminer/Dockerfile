FROM alpine:3.16

RUN apk update && apk add --no-cache php8 php8-session php8-mysqli php8-pdo php8-pdo_mysql php8-json php8-phar php8-openssl php8-curl \
  && if [ ! -f /usr/bin/php ]; then ln -s /usr/bin/php8 /usr/bin/php; fi \
  && mkdir -p /var/www/localhost/htdocs \
  && chmod -R 777 /var/www/localhost/htdocs \
  && wget "https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php" -O /var/www/localhost/htdocs/adminer.php

EXPOSE 8080

CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/localhost/htdocs"]

