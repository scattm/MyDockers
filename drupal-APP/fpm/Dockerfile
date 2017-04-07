FROM php:5.6-fpm-alpine
LABEL maintainer nghia@viisix.space

# Build some php extension
RUN apk add --no-cache freetype libpng libjpeg-turbo freetype-dev libpng-dev libjpeg-turbo-dev \
    && docker-php-ext-configure gd \
        --with-freetype-dir=/usr/include \
        --with-png-dir=/usr/include \
        --with-jpeg-dir=/usr/include \
        && NPROC=$(getconf _NPROCESSORS_ONLN) \
        && docker-php-ext-install -j${NPROC} gd \
        && apk del --no-cache freetype-dev libpng-dev libjpeg-turbo-dev
RUN apk --no-cache add \
    && apk --no-cache add postgresql-dev \
    && docker-php-ext-install pdo pdo_pgsql

# Setting the timezone
RUN echo "date.timezone = 'Asia/Ho_Chi_Minh'" > /usr/local/etc/php/conf.d/drupal.ini

RUN mkdir /composer
WORKDIR /composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');"

CMD ['php-fpm']
