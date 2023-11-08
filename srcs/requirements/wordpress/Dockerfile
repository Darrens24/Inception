FROM	alpine:3.16.7

###   for wordpress, redis configs : /etc/php/php.ini and /etc/php/php.../www.conf   ###
###   WARNING locations changing with PhP versions, this one is for php8    ###

RUN	apk update  \
  &&	apk add wget unzip 

RUN apk add php8 \ 
  php8-fpm php8-mysqli \
  php8-json php8-curl \
  php8-dom php8-exif php8-fileinfo \
  php8-mbstring php8-openssl \
  php8-xml php8-zip php8-redis php8-ctype

WORKDIR /var/www

RUN wget https://wordpress.org/latest.zip \
  && unzip latest.zip && rm latest.zip \
  && cp -r wordpress/* . && rm -rf wordpress \
  && chmod -R 777 wp-content

EXPOSE 9000

COPY	tools/wp-config.sh .

RUN sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php8/php-fpm.d/www.conf \
  && echo "php_admin_flag[ctype] = on" >> /etc/php8/php-fpm.d/www.conf \
  && sed -i "s|;extension=curl|extension=ctype|g" /etc/php8/php.ini 

ENTRYPOINT ["sh", "wp-config.sh"]

RUN mkdir -p wp-content/upgrade && chmod -R 777 wp-content/upgrade

CMD	["php-fpm8", "-F"]

