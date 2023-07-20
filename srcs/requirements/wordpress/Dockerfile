FROM debian:buster

RUN apt update && apt upgrade -y \
  && apt -y install wget php7.3 php-fpm \
  php-mysql mariadb-client

RUN mkdir -p /var/www

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www \
  && cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz \
  && chown -R root:root /var/www/wordpress

COPY ./conf/wp.conf /etc/php/7.3/fpm/pool.d/

# RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
#   && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp \
#   && mkdir -p /run/php && /usr/sbin/php-fpm7.3 -F

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
RUN mkdir -p /run/php

COPY ./conf/wp-setup.sh /tmp/wp-setup.sh

EXPOSE 9000

ENTRYPOINT [ "sh", "/tmp/wp-setup.sh" ]

CMD ["/usr/sbin/php-fpm7.3", "-F"]
