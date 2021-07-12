# zhangsean/php

Official `php:apache` with `mod_rewrite` enabled and PHP `gd`, `oci8`, `pdo_oci`, `redis` ext installed.

[![DockerHub Badge](http://dockeri.co/image/zhangsean/php)](https://hub.docker.com/r/zhangsean/php/)

## Tags

### 7-apache-mysql, latest

Official `php:7-apache` with `mod_rewrite` enabled and PHP `gd`, `zip`, `redis`, `mysqli`, `pdo_mysql` ext installed.

### 7-apache-oci

Official `php:7-apache` with `mod_rewrite` enabled and PHP `gd`, `redis`, `oci8`, `pdo_oci` ext installed, Oracle Instant Client Version `12.2`.

### 7-apache-oci-19

Official `php:7-apache` with `mod_rewrite` enabled and PHP `gd`, `redis`, `oci8`, `pdo_oci` ext installed, Oracle Instant Client Version `19.5`.

### 7-apache-rw

Official `php:7-apache` with `mod_rewrite` enabled.

## Usage

```sh
# Check phpinfo
docker run -it --rm \
    -p 80:80 \
    zhangsean/php:7-apache-mysql

# Mount your php app with pod_mysql support.
docker run -itd \
    --name php-app \
    -p 80:80 \
    -v ~/php-app:/var/www/html \
    zhangsean/php:7-apache-mysql
```
