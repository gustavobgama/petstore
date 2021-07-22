FROM php:7.4-cli-alpine3.13

RUN docker-php-ext-install pdo_mysql

COPY --from=composer:2.1.3 /usr/bin/composer /usr/bin/composer

COPY composer.* /app/

WORKDIR /app

RUN composer install --no-autoloader --no-interaction

COPY . /app

RUN composer dump-autoload --no-scripts --optimize \
    && rm -rf /root/.composer