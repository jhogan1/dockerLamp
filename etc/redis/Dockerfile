FROM redis:7.0.11

COPY ./etc/redis/conf/redis.conf /usr/local/etc/redis/redis.conf
CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]
CMD [ "redis-server", "--appendonly yes" ]
