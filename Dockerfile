FROM php:8.2-apache

# 1. Force Apache to listen to port 10000 instead of 80
RUN sed -i 's/80/10000/g' /etc/apache2/ports.conf /etc/apache2/sites-available/*.conf

# 2. Copy your local PHP files into the container
COPY . /var/www/html/

# 3. Expose port 10000 for Render
EXPOSE 10000

# 4. Let the default Apache boot script handle the server launch
