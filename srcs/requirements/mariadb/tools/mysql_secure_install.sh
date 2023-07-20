#!/usr/bin/expect -f

set timeout -1
spawn mysql_secure_installation

expect "Enter current password for root (enter for none):"
send "\r"

expect "Set root password?"
send "Y\r"
expect "New password:"
send "caca\r"
expect "Re-enter new password:"
send "caca\r"
expect "Remove anonymous users?"
send "Y\r"
expect "Disallow root login remotely?"
send "Y\r"
expect "Remove test database and access to it?"
send "Y\r"
expect "Reload privilege tables now?"
send "Y\r"

expect eof
