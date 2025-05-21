FROM php:8.2-cli

# Install system dependencies
RUN apt-get update && apt-get install -y \
    zip unzip curl git libonig-dev libxml2-dev libzip-dev \
    libpng-dev libjpeg-dev libfreetype6-dev \
    libpq-dev libcurl4-openssl-dev libssl-dev \
    libmcrypt-dev libicu-dev g++ \
    libmysqlclient-dev \
    && docker-php-ext-install pdo_mysql

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

CMD php artisan serve --host=0.0.0.0 --port=8000