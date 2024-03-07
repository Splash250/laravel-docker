# Use a specific version of php:8.2-fpm-alpine for consistency
FROM php:8.2.0-fpm-alpine

# Set working directory
WORKDIR /var/www/html

# Install Composer from the official image
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Install system dependencies and PHP extensions in one layer
# Clean up cache in the same RUN instruction to minimize image size
RUN apk update && apk add --no-cache \
    libpng-dev \
    libzip-dev \
    jpegoptim optipng pngquant gifsicle \
    unzip \
    curl \
    oniguruma-dev \
    libxml2-dev \
    vim \
    mysql-client \
    fish \
    && docker-php-ext-install pdo_mysql zip exif pcntl gd mbstring \
    && rm -rf /var/cache/apk/*

# For improved security, consider adding a non-root user and switch to it
# RUN addgroup -S appgroup && adduser -S appuser -G appgroup
# USER appuser

# Specify the command to run
CMD ["php-fpm"]
