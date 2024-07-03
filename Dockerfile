FROM php:8.2-fpm

RUN docker-php-ext-install pdo pdo_mysql

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
COPY . /var/www/html

WORKDIR /var/www/html
CMD ["composer", "-v"]
CMD ["php", "-S", "0.0.0.0:8000", "index.php"]
EXPOSE 8000
