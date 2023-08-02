#!/bin/sh

sed -i 's/bind 127.0.0.1/bind 0.0.0.0/' /etc/redis.conf

exec redis-server /etc/redis.conf --protected-mode no 
