#!/bin/sh

# Configure Redis
# Comment out the bind address to allow connections from any IP
sed -i "s/bind 127.0.0.1/#bind 127.0.0.1/" /etc/redis/redis.conf

# Start Redis server in the foreground with the updated configuration
redis-server --protected-mode no
