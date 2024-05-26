#!/bin/sh

BIND_LINE="bind 127.0.0.1"
MAXMEMORY_LINE="maxmemory 2mb"
MAXMEMORY_POLICY_LINE="maxmemory-policy allkeys-lru"

if ! grep -qF "$BIND_LINE" /etc/redis/redis.conf || \
   ! grep -qF "$MAXMEMORY_LINE" /etc/redis/redis.conf || \
   ! grep -qF "$MAXMEMORY_POLICY_LINE" /etc/redis/redis.conf; then

    sed -i "s|bind 127.0.0.1|#bind 127.0.0.1|g" /etc/redis/redis.conf
    sed -i "s|# maxmemory <bytes>|maxmemory 2mb|g" /etc/redis/redis.conf
    sed -i "s|# maxmemory-policy noeviction|maxmemory-policy allkeys-lru|g" /etc/redis/redis.conf
fi

exec "$@"

#  redis-cli -h ym_redis monitor
# <?php
# $redis = new Redis();
# $redis->connect('ym_redis', 6379);
# echo "Connection to server successful!";
# echo "Server is running: " . $redis->ping();
# ?>
