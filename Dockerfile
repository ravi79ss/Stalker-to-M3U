FROM php:8.2-cli

# 1. Set the container working directory
WORKDIR /var/www/html

# 2. Copy your PHP files into the container
COPY . /var/www/html/

# 3. Expose the port (Render will map this using your environment variable)
EXPOSE 10000

# 4. Start PHP's built-in web server dynamically on the required port
CMD ["sh", "-c", "php -S 0.0.0.0:$PORT"]
