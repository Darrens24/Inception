FROM    alpine:3.16

RUN apk update && apk add --no-cache ca-certificates

RUN mkdir -p /var/www/hugo

COPY public /var/www/hugo/
