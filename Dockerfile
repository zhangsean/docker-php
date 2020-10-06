FROM php:7-apache
RUN a2enmod rewrite \
 && echo "<?php phpinfo();" > /var/www/html/index.php \
 && apt-get update \
 && apt-get install -y libpng-dev \
 && docker-php-ext-install gd pdo_mysql \
 && apt-get -y autoremove && apt-get clean all && apt-get autoclean && rm -rf /tmp/*
