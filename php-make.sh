#!/bin/bash

PHP_HOME='/usr'

mkdir -p $PHP_HOME
mkdir -p /etc/php
cd $PHP_HOME

git clone https://git.php.net/repository/php-src.git --branch PHP-7.0.7
cd php-src
# do we need to remove buildconf ???
./buildconf --force

./configure \
    --prefix=$PHP_HOME \
    --enable-mbstring \
    --enable-zip \
    --enable-bcmath \
    --enable-pcntl \
    --enable-ftp \
    --enable-exif \
    --enable-calendar \
    --enable-sysvmsg \
    --enable-sysvsem \
    --enable-sysvshm \
    --enable-wddx \
    --with-curl \
    --with-mcrypt \
    --with-iconv \
    --with-gmp \
    --with-gd \
    --with-jpeg-dir=/usr \
    --with-webp-dir=/usr \
    --with-png-dir=/usr \
    --with-zlib-dir=/usr \
    --with-xpm-dir=/usr \
    --with-freetype-dir=/usr \
    --enable-gd-native-ttf \
    --enable-gd-jis-conv \
    --with-openssl \
    --with-zlib \
    --with-bz2 \
    --with-kerberos=shared,/usr/lib \
    --disable-phpdbg \
    --enable-opcache \
    --with-pdo-mysql \
    --with-libxml-dir=/usr \
    --enable-soap \
    --disable-rpath \
    --enable-inline-optimization \
    --enable-sockets \
    --enable-pcntl \
    --enable-mbregex \
    --with-pcre-regex \
    --with-mysqli \
    --with-libdir=/lib \
    --with-gettext \
    --with-xmlrpc \
    --with-xsl \
    --enable-fpm \
    --enable-phar
    
make
make install
make clean

mkdir -p /var/run/php-fpm

rm -Rf php-src
rm -Rf $PHP_HOME/php-src

# ln -s $PHP_HOME/php7/php-src/sapi/cli/php /usr/bin/php
