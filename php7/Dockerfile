FROM ubuntu:xenial

LABEL version="0.1"
LABEL description="Apache2.4 PHP7"
LABEL maintainer "laurent@ipeos.com"

# Avoid ERROR: invoke-rc.d: policy-rc.d denied execution of start.
RUN sed -i "s/^exit 101$/exit 0/" /usr/sbin/policy-rc.d

RUN apt-get -y -q update \
  && DEBIAN_FRONTEND=noninteractive apt-get -y -q --no-install-recommends install \
    curl \
    imagemagick \
    apache2 \
    mysql-client \
    libmysqlclient-dev \
    php7.0 \
    php7.0-cgi \
    php7.0-cli \
    php7.0-common \
    php7.0-curl \
    php7.0-dev \
    php7.0-gd \
    php7.0-json \
    php7.0-mbstring \
    php7.0-mcrypt \
    php7.0-mysql \
    php7.0-opcache \
    php7.0-readline \
    php7.0-sqlite3 \
    php7.0-xml \
    php7.0-zip \
    php7.0-gettext \
    php-imagick \
    php-tcpdf \
    libapache2-mod-php7.0 \
    gettext-base \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && rm /var/log/dpkg.log \
  && rm /var/www/html/index.html

RUN a2enmod php7.0

ENV LANG=C

ENV PHP_ERROR_REPORTING E_ALL & ~E_DEPRECATED & ~E_STRICT
ENV PHP_DISPLAY_ERRORS On
ENV PHP_UPLOAD_MAX_FILE_SIZE 20M
ENV PHP_POST_MAX_SIZE 28M
ENV PHP_MEMORY_LIMIT 256M
ENV PHP_EXPOSE_PHP Off
ENV PHP_TIMEZONE UTC

WORKDIR /var/www/html

EXPOSE 80

# install the entrypoint
COPY ./entrypoint.sh /

RUN /entrypoint.sh

CMD ["apache2ctl", "-DFOREGROUND"]