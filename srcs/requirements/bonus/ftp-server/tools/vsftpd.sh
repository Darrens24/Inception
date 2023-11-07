#!/bin/sh

mkdir -p /var/www/html

cp /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf.bak
mv /tmp/vsftpd.conf /etc/vsftpd/vsftpd.conf

# Add the FTP_USER, change his password and declare him as the owner of wordpress folder and all subfolders
adduser ed --disabled-password
echo "$FTP_USR:$FTP_PSSWD" | /usr/sbin/chpasswd &> /dev/null
chown -R ed:ed /var/www/html

echo $FTP_USR | tee -a /etc/vsftpd.userlist &> /dev/null

echo "Let's go FTP"
/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
