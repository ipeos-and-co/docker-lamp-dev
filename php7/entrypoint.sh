#!/bin/bash
cp /etc/php/7.0/apache2/php.ini /tmp/php.ini.tpl
sed -i "s/error_reporting = .*/error_reporting = \${PHP_ERROR_REPORTING}/g" /tmp/php.ini.tpl
sed -i "s/display_errors = .*/display_errors = \${PHP_DISPLAY_ERRORS}/g" /tmp/php.ini.tpl
sed -i "s/upload_max_filesize = .*/upload_max_filesize = \${PHP_UPLOAD_MAX_FILE_SIZE}/g" /tmp/php.ini.tpl
sed -i "s/memory_limit = .*/memory_limit = \${PHP_MEMORY_LIMIT}/g" /tmp/php.ini.tpl
sed -i "s/post_max_size = .*/post_max_size = \${PHP_POST_MAX_SIZE}/g" /tmp/php.ini.tpl
sed -i "s/expose_php = .*/expose_php = \${PHP_EXPOSE_PHP}/g" /tmp/php.ini.tpl
sed -i "s/;date.timezone = .*/date.timezone = \${PHP_TIMEZONE}/g" /tmp/php.ini.tpl

envsubst < /tmp/php.ini.tpl > /etc/php/7.0/apache2/php.ini
rm /tmp/php.ini.tpl

echo "ServerName lamp-dev-php7" >> /etc/apache2/apache2.conf

service apache2 restart
