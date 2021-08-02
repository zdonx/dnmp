ARG BASE_IMAGE_TAG_PREFIX=''
FROM php:${BASE_IMAGE_TAG_PREFIX}-fpm

ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/

ARG CHANGE_SOURCE=true
RUN if [ ${CHANGE_SOURCE} = true ]; then \
    # Change application source from deb.debian.org to aliyun source
    sed -i 's/deb.debian.org/mirrors.aliyun.com/' /etc/apt/sources.list && \
    sed -i 's/security.debian.org/mirrors.aliyun.com/' /etc/apt/sources.list && \
    sed -i 's/security-cdn.debian.org/mirrors.aliyun.com/' /etc/apt/sources.list \
;fi

RUN chmod uga+x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions zip redis pdo_mysql bcmath mcrypt gd xdebug sockets

RUN php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer
RUN composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/

CMD ["php-fpm"]

EXPOSE 9000