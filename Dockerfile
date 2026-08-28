FROM php:8.2-apache

# 1. Force Apache to listen on IPv4 0.0.0.0 and port 10000
RUN sed -i 's/Listen 80/Listen 0.0.0.0:10000/g' /etc/apache2/ports.conf
RUN sed -i 's/:80>/:10000>/g' /etc/apache2/sites-available/*.conf

# 2. Copy your local PHP files into the container
COPY . /var/www/html/

# 3. Expose port 10000 for Render
EXPOSE 10000
