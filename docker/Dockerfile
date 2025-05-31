FROM php:8.1-fpm

# Install dependencies + GD
RUN apt-get update && apt-get install -y \
    git curl nano unzip libzip-dev zip libpng-dev libjpeg-dev libfreetype6-dev \
    libonig-dev libxml2-dev libgd-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo pdo_mysql zip mbstring exif pcntl bcmath gd

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/html
