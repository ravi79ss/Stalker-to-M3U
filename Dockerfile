# Use an official PHP runtime with Apache
FROM php:8.2-apache

# Copy your local PHP files into the container's web server directory
COPY . /var/www/html/

# Expose port 80 to allow web traffic
EXPOSE 80
