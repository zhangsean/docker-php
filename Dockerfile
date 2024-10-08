FROM php:apache
ENV PHPREDIS_VERSION=5.3.7
RUN a2enmod rewrite \
 && sed -i '/DocumentRoot/a \        php_admin_value open_basedir "/var/www/html"' /etc/apache2/sites-enabled/000-default.conf \
 && echo "<?php phpinfo();" > /var/www/html/index.php \
 && apt-get update \
 && apt-get install -y libpng-dev libzip-dev \
 && curl -SLo /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/${PHPREDIS_VERSION}.tar.gz \
 && tar zxvf /tmp/redis.tar.gz \
 && rm -rf /tmp/redis.tar.gz \
 && mkdir -p /usr/src/php/ext \
 && mv phpredis-${PHPREDIS_VERSION} /usr/src/php/ext/redis \
 && docker-php-ext-install gd redis mysqli pdo_mysql zip \
 && apt-get -y autoremove && apt-get clean all && apt-get autoclean \
 && rm -rf /var/lib/apt/lists/* && rm -rf /var/cache/debconf/* && rm -rf /tmp/*
