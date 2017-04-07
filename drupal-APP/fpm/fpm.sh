#!/bin/sh

WORKING_DIR=/app

cd $WORKING_DIR
# Install packages using composer
# Composer is installed when Docker Image for PHP-FPM is builed
php /composer/composer.phar install

# Start PHP-FPM service
php-fpm
