FROM php:7.3

# Dépendences nécessaires pour les extensions PHP, plus Wget/Git/SSH
RUN apt-get update && apt-get install --no-install-recommends -yq ${BUILD_PACKAGES} \
        build-essential \
        wget \
        ssh \
        git \
        libmcrypt-dev \
        libicu-dev \
        libzip-dev \
    && apt-get clean

# Quelques extensions PHP recommmandées
ENV PHP_EXTENSIONS opcache pdo_mysql pcntl intl zip
RUN docker-php-ext-install ${PHP_EXTENSIONS}

# Installation de composer
ENV COMPOSER_ALLOW_SUPERUSER=1
RUN curl -sS https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/local/bin
