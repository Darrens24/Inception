FROM alpine:3.18.0

RUN apk update && apk upgrade && apk add openssl \
  nginx \
  sudo 

# create dir for certificates, config files and create key/certif for nginx in the same command
RUN mkdir -p /etc/nginx/ssl && mkdir -p /var/run/nginx && openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=PACA/L=Marseille/O=42/CN=eleleux.42.fr/UID=eleleux"

# chown modify the owner and the group passed as 2nd argument so it can be accessed by the root position in the container
RUN mkdir -p /var/www/html && chmod 777 /var/www/html && chown -R nginx:nginx /var/www/html

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

CMD [ "nginx", "-g", "daemon off;" ]
