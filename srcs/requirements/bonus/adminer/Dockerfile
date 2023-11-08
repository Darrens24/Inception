FROM alpine:3.16.7

RUN apk update && apk add --no-cache php8 php8-session php8-mysqli php8-pdo php8-pdo_mysql php8-json php8-phar php8-openssl php8-curl \
  && if [ ! -f /usr/bin/php ]; then ln -s /usr/bin/php8 /usr/bin/php; fi

WORKDIR /var/www

RUN wget "https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php" \
  &&  mv adminer-4.8.1.php index.php && chown -R root:root /var/www/

EXPOSE 8080

CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www"]
