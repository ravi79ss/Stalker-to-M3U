FROM php:8.2-apache

# 1. Properly rewrite Apache ports to listen on 10000
RUN sed -i 's/Listen 80/Listen 10000/g' /etc/apache2/ports.conf
RUN sed -i 's/<VirtualHost \*:80>/<VirtualHost \*:10000>/g' /etc/apache2/sites-available/*.conf

# 2. Enable Apache mod_rewrite for your .htaccess rules
RUN a2enmod rewrite

# 3. Allow .htaccess overrides in the web directory
RUN sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

# 4. Copy your PHP files into the server directory
COPY . /var/www/html/

# 5. Secure file permissions for Apache web user
RUN chown -R www-data:www-data /var/www/html

EXPOSE 10000
