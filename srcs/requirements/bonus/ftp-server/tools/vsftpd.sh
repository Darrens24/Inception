#!/bin/sh

# mkdir -p /var/run/vsftpd
# mkdir -p /var/run/vsftpd/empty
#
# cp /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf.bak
# mv /tmp/vsftpd.conf /etc/vsftpd/vsftpd.conf

# Add the FTP_USER, change his password and declare him as the owner of wordpress folder and all subfolders
# adduser ed --disabled-password
# echo "ed:secret" | /usr/sbin/chpasswd &> /dev/null
# chown -R ed:ed /home/ed
#
# echo ed | tee -a /etc/vsftpd.userlist &> /dev/null
#
#
# vsftpd /etc/vsftpd/vsftpd.conf
# echo "FTP started on :21"
# /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf

# adduser ed --disabled-password
# chown -R ed:ed /var/www
#
# echo "ed:secret" | /usr/sbin/chpasswd &> /dev/null
# echo ed | tee -a /etc/vsftpd.userlist &> /dev/null
#
# echo "Let's go FTP !"

    mkdir -p /var/www/html

    cp /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf.bak
    mv /tmp/vsftpd.conf /etc/vsftpd/vsftpd.conf

    # Add the FTP_USER, change his password and declare him as the owner of wordpress folder and all subfolders
    adduser ed --disabled-password
    echo "ed:secret" | /usr/sbin/chpasswd &> /dev/null
    chown -R ed:ed /var/www/html

	#chmod +x /etc/vsftpd/vsftpd.conf
    echo ed | tee -a /etc/vsftpd.userlist &> /dev/null


echo "FTP started on :21"
/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
