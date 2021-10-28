FROM debian:11

LABEL version="0.2.0"
LABEL description="Apache2.4 PHP7.4"
LABEL maintainer "laurent@ipeos.com"

# Avoid ERROR: invoke-rc.d: policy-rc.d denied execution of start.
RUN sed -i "s/^exit 101$/exit 0/" /usr/sbin/policy-rc.d

RUN apt-get -y -q update \
  && DEBIAN_FRONTEND=noninteractive apt-get -y -q --no-install-recommends install \
  curl \
  imagemagick \
  apache2 \
  mariadb-client \
  libmariadb-dev \
  php7.4 \
  php7.4-cgi \
  php7.4-cli \
  php7.4-common \
  php7.4-curl \
  php7.4-dev \
  php7.4-gd \
  php7.4-json \
  php7.4-ldap \
  php7.4-mbstring \
  # php7.0-mcrypt \
  php7.4-mysql \
  php7.4-opcache \
  php7.4-pgsql \
  php7.4-readline \
  php7.4-sqlite3 \
  php7.4-xml \
  php7.4-zip \
  # php7.0-gettext \
  php7.4-intl \
  php7.4-xsl \
  php-apcu \
  php-imagick \
  php-tcpdf \
  libapache2-mod-php7.4 \
  gettext-base \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && rm /var/log/dpkg.log \
  && rm /var/www/html/index.html

RUN a2enmod php7.4

ENV LANG=C

ENV PHP_ERROR_REPORTING E_ALL & ~E_DEPRECATED & ~E_STRICT
ENV PHP_DISPLAY_ERRORS On
ENV PHP_UPLOAD_MAX_FILE_SIZE 8M
ENV PHP_POST_MAX_SIZE 2M
ENV PHP_MEMORY_LIMIT 128M
ENV PHP_EXPOSE_PHP Off
ENV PHP_TIMEZONE UTC
ENV ENABLE_HTACCESS On

COPY ./apache-dir.conf /etc/apache2/conf-available/

WORKDIR /var/www/html

EXPOSE 80

COPY ./entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]