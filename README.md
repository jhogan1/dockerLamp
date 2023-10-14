# LAMP MASTER


## Add /etc/hosts entries
_e.g. `sudo vim /etc/hosts` adding these lines_

```
local-web.lampmaster.com    127.0.0.1
local-api.lampmaster.com   127.0.0.1
```

## Create SSL certificate

```
$ brew install mkcert

$ mkcert -install
```

You can execute these commands from anywhere in your home directory that you like.  Each will generate two `.pem` files in your current working directory that you will rename and copy elsewhere.

```
$ mkcert local-web.lampmaster.com 127.0.0.1 ::1
```
The certificate is: ``./local-web.lampmaster.com+2.pem``

The key is: ``./local-web.lampmaster.com+2-key.pem``

Rename and copy the CRT files:

```
$ cp ./local-web.lampmaster.com+2.pem <your project root>/lamp/etc/ssl/local-web.lampmaster.com.crt
$ cp ./local-web.lampmaster.com+2.pem <your project root>/etc/php-apache/apache2/ssl_certs/local-web.lampmaster.com.crt
```

Rename and copy the KEY files:

```
$ cp ./local-web.lampmaster.com+2-key.pem <your project root>/lamp/etc/ssl/local-web.lampmaster.com.key
$ cp ./local-web.lampmaster.com+2-key.pem <your project root>/etc/php-apache/apache2/ssl_certs/local-web.lampmaster.com.key
```

## Copy/Rename .dist files

This project contain several `<sample>.dist` files. Copy and save them to their current directory without the `.dist` extension.

``./etc/php-apache/php/php.ini.dist`` becomes ``./etc/php-apache/php/php.ini``

``./etc/php-apache/php/conf.d/xdebug.ini.dist`` becomes ``./etc/php-apache/php/conf.d/xdebug.ini``

``./etc/php-apache/apache2/conf/apache2.conf.dist`` becomes ``./etc/php-apache/apache2/conf/apache2.conf``

``./etc/php-apache/apache2/vhost/sites-enabled/local-web.conf.dist`` becomes ``./etc/php-apache/apache2/vhost/sites-enabled/wf-proxy.conf``

``./etc/mysql/conf/my.cnf.dist`` becomes ``./etc/mysql/conf/my.cnf``

``./etc/redis/conf/redis.conf.dist`` becomes ``./etc/redis/conf/redis.conf``

```

Create the lamp_Dev Db user

```
CREATE USER IF NOT EXISTS lampDevUser@'%' IDENTIFIED BY 'lampDevPwd';
GRANT ALL ON *.* TO lampDevUser@'%' WITH GRANT OPTION;
```
