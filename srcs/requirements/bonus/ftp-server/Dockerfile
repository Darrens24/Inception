FROM alpine:3.16

RUN	apk update && apk upgrade && apk add --no-cache \
  vsftpd

COPY tools/vsftpd.conf /tmp/vsftpd.conf

COPY tools/vsftpd.sh /tmp/server_ftp.sh

ENTRYPOINT ["sh", "/tmp/server_ftp.sh"]

# FROM alpine:3.16
#
# RUN apk update && apk upgrade \
#   && apk add vsftpd openrc \
#   && mkdir -p /var/www
#
# COPY ./tools/vsftpd.conf /tmp/vsftpd.conf
# COPY ./tools/vsftpd.sh /tmp/vsftpd.sh
#
# ENTRYPOINT ["sh", "/tmp/vsftpd.sh"]
