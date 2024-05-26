#!/bin/sh

    sed -i "s|bind 127.0.0.1|#bind 127.0.0.1|g" /etc/redis/redis.conf
    sed -i "s|# maxmemory <bytes>|maxmemory 2mb|g" /etc/redis/redis.conf
    sed -i "s|# maxmemory-policy noeviction|maxmemory-policy allkeys-lru|g" /etc/redis/redis.conf


exec "$@"
#  redis-cli -h ym_redis monitor
# <?php
# $redis = new Redis();
# $redis->connect('ym_redis', 6379);
# echo "Connection to server successful!";
# echo "Server is running: " . $redis->ping();
# ?>
