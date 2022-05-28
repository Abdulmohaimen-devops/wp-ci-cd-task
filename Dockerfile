FROM wordpress:php7.1-apache

COPY code/ /var/www/html

RUN chown -R www-data:www-data /var/www/html
