FROM alpine:3.16

RUN apk update && apk upgrade \
  && apk add redis

COPY tools/redis-init.sh /tmp/redis-init.sh

EXPOSE 6379

ENTRYPOINT ["sh", "/tmp/redis-init.sh"]
