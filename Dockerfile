FROM php:7-apache
RUN a2enmod rewrite \
 && echo "<?php phpinfo();" > /var/www/html/index.php \
 && apt-get update \
 && apt-get install -y libpng-dev unzip libaio1 \
 && curl -sSLo /tmp/instantclient_12_2.zip https://download.oracle.com/otn/linux/instantclient/122010/instantclient-basic-linux.x64-12.2.0.1.0.zip?AuthParam=1601992015_ec064199411f7c23d1e39c6bc705024e \
 && unzip /tmp/instantclient_12_2.zip -d /usr/oracle/ && rm -f /tmp/instantclient_12_2.zip \
 && ln -s /usr/oracle/instantclient_12_2 /usr/oracle/instantclient \
 && ln -sf /usr/oracle/instantclient /sqlplus /usr/local/bin/ \
 && ln -sf /usr/oracle/instantclient/libclntsh.so.12.1 /usr/oracle/instantclient/libclntsh.so \
 && export ORACLE_HOME=/usr/oracle/instantclient/ \
 && docker-php-ext-configure oci8 --with-oci8=shared,instantclient,/usr/oracle/instantclient/ \
 && docker-php-ext-configure pdo_oci --with-pdo-oci=instantclient,/usr/oracle/instantclient,12.1 \
 && docker-php-ext-install gd oci8 pdo_oci \
 && apt-get -y autoremove && apt-get clean all && apt-get autoclean \
 && rm -rf /var/lib/apt/lists/* && rm -rf /var/cache/debconf/* && rm -rf /tmp/*
