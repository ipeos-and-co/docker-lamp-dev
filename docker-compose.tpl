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

  apache2php7:
    image: ipeos/lamp-dev:php7
    restart: always
    container_name: ${DOCKER_PREFIX}_web
    links:
      - mariadb:mysql
    ports:
      - ${PHP7_HOST_PORT}:80
    volumes:
      - ${DOCKER_DIR}/web:/var/www/html
    environment:
    - PHP_UPLOAD_MAX_FILE_SIZE=${PHP_UPLOAD_MAX_FILE_SIZE}
    - PHP_POST_MAX_SIZE=${PHP_POST_MAX_SIZE}
    - PHP_MEMORY_LIMIT=${PHP_MEMORY_LIMIT}
    - PHP_TIMEZONE=${PHP_TIMEZONE}

  apache2php5:
    image: ipeos/lamp-dev:php5
    restart: always
    container_name: ${DOCKER_PREFIX}_web_php5
    links:
      - mariadb:mysql
    ports:
      - ${PHP5_HOST_PORT}:80
    environment:
      - PHP_UPLOAD_MAX_FILE_SIZE=${PHP_UPLOAD_MAX_FILE_SIZE}
      - PHP_POST_MAX_SIZE=${PHP_POST_MAX_SIZE}
      - PHP_MEMORY_LIMIT=${PHP_MEMORY_LIMIT}
      - PHP_TIMEZONE=${PHP_TIMEZONE}
    volumes:
      - ${DOCKER_DIR}/web:/var/www/html

  phpmyadmin:
    image: phpmyadmin/phpmyadmin:latest
    restart: always
    container_name: ${DOCKER_PREFIX}_phpmyadmin
    links:
      - mariadb:db
    ports:
      - ${PMA_HOST_PORT}:80
