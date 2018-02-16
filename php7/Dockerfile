FROM ubuntu:xenial

LABEL version="0.1.1"
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
    php7.0-intl \
    php7.0-xsl \
    php7.0-ldap \
    php-pear \
    php-imagick \
    php-tcpdf \
    libapache2-mod-php7.0 \
    gettext-base \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && rm /var/log/dpkg.log \
  && rm /var/www/html/index.html

RUN a2enmod php7.0

RUN pecl install apcu

RUN echo "extension = apcu.so" | tee -a /etc/php/7.0/mods-available/apcu.ini

RUN ln -s /etc/php/7.0/mods-available/apcu.ini /etc/php/7.0/apache2/conf.d/30-apcu.ini

ENV LANG=C

ENV PHP_ERROR_REPORTING E_ALL & ~E_DEPRECATED & ~E_STRICT
ENV PHP_DISPLAY_ERRORS On
ENV PHP_UPLOAD_MAX_FILE_SIZE 8M
ENV PHP_POST_MAX_SIZE 2M
ENV PHP_MEMORY_LIMIT 128M
ENV PHP_EXPOSE_PHP Off
ENV PHP_TIMEZONE UTC

WORKDIR /var/www/html

EXPOSE 80

COPY ./entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
