FROM php:7.3-apache


# Install extension
RUN apt-get update && \
    apt-get install -y libzip-dev zip && \
    docker-php-ext-configure zip --with-libzip && \
    docker-php-ext-install zip

RUN apt-get update && \
    apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng-dev && \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install gd

RUN apt-get update && \
    apt-get install -y zlib1g-dev libicu-dev g++ && \
    docker-php-ext-configure intl && \
    docker-php-ext-install intl

RUN apt-get update && \
    apt-get install libxml2-dev && \
    docker-php-ext-install xmlrpc

RUN apt-get update && docker-php-ext-install mysqli opcache soap

# Copy docker-init.sh into container
COPY docker-init.sh /

# Install app
ADD . /var/www/html


