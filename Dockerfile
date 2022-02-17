FROM php:7-apache
ENV ORACLE_HOME=/usr/oracle/instantclient \
    PHPREDIS_VERSION=5.3.7
RUN a2enmod rewrite \
 && echo "<?php phpinfo();" > /var/www/html/index.php \
 && apt-get update \
 && apt-get install -y libpng-dev unzip libaio1 \
 && docker-php-source extract \
 && curl -SLo /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/${PHPREDIS_VERSION}.tar.gz \
 && tar zxvf /tmp/redis.tar.gz \
 && rm -rf /tmp/redis.tar.gz \
 && mv phpredis-${PHPREDIS_VERSION} /usr/src/php/ext/redis \
 && curl -sSLo /tmp/instantclient.zip https://download.oracle.com/otn_software/linux/instantclient/195000/instantclient-basic-linux.x64-19.5.0.0.0dbru.zip \
 && curl -sSLo /tmp/instantclient-sdk.zip https://download.oracle.com/otn_software/linux/instantclient/195000/instantclient-sdk-linux.x64-19.5.0.0.0dbru.zip \
 && unzip /tmp/instantclient.zip -d /usr/oracle/ \
 && unzip /tmp/instantclient-sdk.zip -d /usr/oracle/ \
 && rm -f /tmp/instantclient*.zip \
 && ln -s /usr/oracle/instantclient_19_5 /usr/oracle/instantclient \
 && echo /usr/oracle/instantclient > /etc/ld.so.conf.d/oracle-instantclient.conf \
 && ldconfig \
 && docker-php-ext-configure oci8 --with-oci8=shared,instantclient,/usr/oracle/instantclient \
 && docker-php-ext-configure pdo_oci --with-pdo-oci=instantclient,/usr/oracle/instantclient \
 && docker-php-ext-install gd redis oci8 pdo_oci \
 && docker-php-source delete \
 && apt-get -y autoremove && apt-get clean all && apt-get autoclean \
 && rm -rf /var/lib/apt/lists/* && rm -rf /var/cache/debconf/* && rm -rf /tmp/*
