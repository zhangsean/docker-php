FROM php:7-apache
RUN a2enmod rewrite \
 && echo "<?php phpinfo();" > /var/www/html/index.php
