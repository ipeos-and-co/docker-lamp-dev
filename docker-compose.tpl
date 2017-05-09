version: '2'
services:
  mariadb:
    image: mariadb:10
    restart: always
    container_name: ${DOCKER_PREFIX}_db
    environment:
      - MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
    volumes:
      - ${DOCKER_DIR}/db:/var/lib/mysql

  apache2php:
    image: ipeos/lamp-dev:${PHP_VERSION}
    restart: always
    container_name: ${DOCKER_PREFIX}_web
    links:
      - mariadb:mysql
    ports:
      - ${PHP_HOST_PORT}:80
    volumes:
      - ${DOCKER_DIR}/web:/var/www/html
    environment:
    - PHP_UPLOAD_MAX_FILE_SIZE=${PHP_UPLOAD_MAX_FILE_SIZE}
    - PHP_POST_MAX_SIZE=${PHP_POST_MAX_SIZE}
    - PHP_MEMORY_LIMIT=${PHP_MEMORY_LIMIT}
    - PHP_TIMEZONE=${PHP_TIMEZONE}

  phpmyadmin:
    image: phpmyadmin/phpmyadmin:latest
    restart: always
    container_name: ${DOCKER_PREFIX}_phpmyadmin
    links:
      - mariadb:db
    ports:
      - ${PMA_HOST_PORT}:80
