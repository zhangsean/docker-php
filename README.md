# zhangsean/php

Offical `php:apache` with `mod_rewrite` enabled.

[![DockerHub Badge](http://dockeri.co/image/zhangsean/php)](https://hub.docker.com/r/zhangsean/php/)

## Usage

```sh
# K8s authorize by token
docker run -itd \
    --name php-app \
    -p 80:80 \
    -v ~/php-app:/var/www/html \
    zhangsean/php:7-apache-rw
```
