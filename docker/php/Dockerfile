FROM php:8.3-fpm

RUN apt-get update && apt-get install -y \
    git procps curl zip unzip libpng-dev libonig-dev libxml2-dev libzip-dev

RUN docker-php-ext-install pdo_mysql mbstring zip exif pcntl

RUN pecl install redis \
    && docker-php-ext-enable redis

ARG CFLAGS="-Wno-incompatible-pointer-types"

RUN pecl channel-update pecl.php.net \
    && pecl install phalcon \
    && docker-php-ext-enable phalcon

# Install Composer (official recommended method)
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

RUN mkdir -p /scripts

EXPOSE 8080