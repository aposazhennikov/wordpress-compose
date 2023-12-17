FROM php:8.1-fpm
RUN apt-get update && \
    apt-get install -y wget tar libzip-dev && \
    docker-php-ext-install zip mysqli
RUN useradd -ms /bin/bash app && chown -R app:app /var/www/html 
USER app
WORKDIR /var/www/html
RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xvf latest.tar.gz && \
    rm latest.tar.gz && \
    mv wordpress/* . && \
    rmdir wordpress
CMD ["php-fpm"]












