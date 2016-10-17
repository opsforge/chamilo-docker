# Dockerfile of Chamilo

FROM php:5.6-apache

MAINTAINER opsforge.io
LABEL name="chamilo"
LABEL version="0.1.0"

EXPOSE 80

VOLUME ["/var/www/html"]

RUN apt-get update && \
    apt-get install libicu-dev libjpeg-dev libpng-dev libfreetype6-dev -y && \
    apt-get clean

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install -j$(nproc) pdo_mysql intl gd

COPY php-lms.ini /usr/local/etc/php/php.ini

CMD /bin/bash -c 'a2enmod rewrite; apache2-foreground'
