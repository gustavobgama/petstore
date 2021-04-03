FROM php:7.4-cli-alpine3.13

RUN docker-php-ext-install pdo_mysql

COPY . /app

ENTRYPOINT ["/bin/sh", "/app/docker-entrypoint.sh"]