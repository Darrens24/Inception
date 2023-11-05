FROM	alpine:3.16

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
  # && mkdir ./wp-content/upgrade \
  && chmod -R 777 wp-content
# && chown -R root:root /var/www


EXPOSE 9000

COPY	tools/wp-config.sh .

RUN sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php8/php-fpm.d/www.conf \
  && echo "php_admin_flag[ctype] = on" >> /etc/php8/php-fpm.d/www.conf \
  && sed -i "s|;extension=curl|extension=ctype|g" /etc/php8/php.ini 

ENTRYPOINT ["sh", "wp-config.sh"]

# RUN chmod 777 /var/www/wp-content/upgrade


CMD	["php-fpm8", "-F"]

# FROM debian:buster
#
# RUN apt update && apt upgrade -y \
#   && apt -y install wget php7.3 php-fpm \
#   php-mysql mariadb-client
#
# RUN mkdir -p /var/www
#
# RUN wget https://fr.wordpress.org/wordpress-6.2-fr_FR.tar.gz -P /var/www \
#   && cd /var/www && tar -xzf wordpress-6.2-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz \
#   && chown -R root:root /var/www/wordpress
#
# COPY ./conf/wp.conf /etc/php/7.3/fpm/pool.d/
#
# RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
# RUN mkdir -p /run/php
#
# COPY ./conf/wp-setup.sh /tmp/wp-setup.sh
#
# EXPOSE 9000
#
# ENTRYPOINT [ "sh", "/tmp/wp-setup.sh" ]
#
# CMD ["/usr/sbin/php-fpm7.3", "-F"]
