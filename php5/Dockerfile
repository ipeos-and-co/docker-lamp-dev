FROM debian:jessie

MAINTAINER Laurent Vergerolle <laurent@ipeos.com>

LABEL version="0.1"
LABEL description="Debian Apache2 PHP5"

# Avoid ERROR: invoke-rc.d: policy-rc.d denied execution of start.
RUN sed -i "s/^exit 101$/exit 0/" /usr/sbin/policy-rc.d

RUN apt-get -y -q update \
  && DEBIAN_FRONTEND=noninteractive apt-get -y -q --no-install-recommends install \
    curl \
    imagemagick \
    mysql-client \
    libmysqlclient-dev \
    apache2 \
    libapache2-mod-fcgid \
    libapache2-mod-php5 \
    php5 \
    php5-cgi \
    php5-cli \
    php5-common \
    php5-curl \
    php5-dev \
    php5-gd \
    php5-json \
    php5-mcrypt \
    php5-sqlite \
    php-gettext \
    php-tcpdf \
    php5-mysql \
    php5-imagick \
    gettext-base \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && rm /var/log/dpkg.log \
  && rm /var/www/html/index.html

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