FROM nginx:alpine
MAINTAINER dieKeuleCT<koehlmeier@gmail.com>

# install some extensions for PHP and PHP Compilation
RUN apk --update add wget \ 
    curl \
    git \
    grep \
    libjpeg \
    build-base \
    tar \
    make \
    autoconf \
    re2c \
    bison \
    bash \
    gmp-dev \
    libmcrypt-dev \
    freetype-dev \
    libxpm-dev \
    libwebp-dev \
    libjpeg-turbo-dev \
    bzip2-dev \
    openssl-dev \
    krb5-dev \
    libxml2-dev \
    gettext-dev \
    libxslt-dev\
    curl-dev 
	
ADD php-make.sh /
RUN /bin/sh /php-make.sh

# cleanup - removing dev libraries and install non-dev
RUN apk del gcc \
    make \
    g++ \
    build-base \
    git \
    perl \
    autoconf

RUN rm /var/cache/apk/* /php-make.sh
