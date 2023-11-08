FROM alpine:3.16.7

RUN apk update && apk upgrade && apk add openssl \
  nginx 

# create dir for certificates, config files and  key/certif
RUN mkdir -p /etc/nginx/ssl \
  && mkdir -p /var/run/nginx \
  && openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=PACA/L=Marseille/O=42/CN=eleleux.42.fr/UID=eleleux"

RUN mkdir -p /var/www/html && chmod 777 /var/www/html

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]
