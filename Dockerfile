FROM php:8.2-apache

# 1. Properly rewrite Apache ports in both available and enabled site configurations
RUN sed -i 's/Listen 80/Listen 10000/g' /etc/apache2/ports.conf
RUN sed -i 's/<VirtualHost \*:80>/<VirtualHost \*:10000>/g' /etc/apache2/sites-available/*.conf

# 2. Copy your PHP files into the server directory
COPY . /var/www/html/

# 3. Secure file permissions for Apache web user
RUN chown -R www-data:www-data /var/www/html

# 4. Open up port 10000
EXPOSE 10000
