FROM arm64v8/php:8.0-apache

COPY ./local-web/ /var/www/html/local-web
RUN chown -R www-data:www-data /var/www/html/local-web

RUN mkdir -p /etc/apache2/ssl
COPY ./etc/php-apache/apache2/ssl_certs/*.crt /etc/apache2/ssl/
COPY ./etc/php-apache/apache2/ssl_certs/*.key /etc/apache2/ssl/
COPY ./etc/php-apache/apache2/vhosts/sites-enabled/*.conf /etc/apache2/sites-enabled/
COPY ./etc/php-apache/apache2/conf/apache2.conf /etc/apache2/

RUN pecl install xdebug-3.2.1
RUN pecl install redis-5.3.7

RUN  apt-get update

RUN apt-get -y install --fix-missing \
    mariadb-client \
    nodejs \
    npm \
    vim \
    apt-utils \
    iputils-ping \
    build-essential \
    curl \
    git \
    libcurl4 \
    libcurl4-openssl-dev \
    libzip-dev \
    libbz2-dev \
    libgd3 \
    libmcrypt-dev \
    libicu-dev \
    libonig-dev \
    libxml2-dev \
    libpq-dev \
    locales \
    zip \
    zlib1g-dev

RUN docker-php-ext-install \
    exif \
    pcntl \
    bcmath \
    ctype \
    curl \
    iconv \
    xml \
    soap \
    pcntl \
    mbstring \
    bz2 \
    zip \
    intl \
    mysqli \
    pdo \
    pdo_mysql

RUN docker-php-ext-enable \
    pdo_mysql \
    xdebug \
    redis

RUN apt-get update && apt-get upgrade -y
RUN rm -rf /var/lib/apt/lists/*

RUN a2enmod ssl rewrite headers

COPY --from=composer /usr/bin/composer /usr/bin/composer

EXPOSE 9501 80 443
