# docker-lamp-dev

Dockerfile to provide a ready to use LAMP environment.

This environment is intended to be used in web development courses, It activates all PHP extensions and show all PHP errors. It must not be used in production.

## Supported tags respective `Dockerfile` links

- `php7`, `latest`
- `php5`

## Installation

Automated builds of the image are available on [Dockerhub](https://hub.docker.com/r/ipeos/lamp-dev/) and is the recommanded method of installation.

```bash
$ docker pull ipeos/lamp-dev:latest
```

## Environment vars availables

Some vars can upgrade the `php.ini`

- `PHP_ERROR_REPORTING`: `E_ALL & ~E_DEPRECATED & ~E_STRICT`
- `PHP_DISPLAY_ERRORS`: `On`
- `PHP_UPLOAD_MAX_FILE_SIZE`: `20M`
- `PHP_POST_MAX_SIZE`: `28M`
- `PHP_MEMORY_LIMIT`: `256M`
- `PHP_EXPOSE_PHP`: `Off`
- `PHP_TIMEZONE`: `UTC`

## Run Simple PHP Website Without Database

```bash
docker run -p 8888:80 -v /home/user/public_html:/var/www/html --name lamp ipeos/lamp-dev:latest
```
Now that the LAMP server’s running, visit http://127.0.0.1:8888/ with your Web browser.

The site's PHP and static files are directly accessible in the local volume you mounted as `/var/www/html` in the lamp container.

## Use Docker Compose to build LAMP environment

The quickest way to get started is using  [docker-compose](https://docs.docker.com/compose/).

You can create a custom `docker-compose.yml` file for your project, by setting environment variables and running the script `run.sh`:

1. edit `docker-compose.env`
2. Start the lamp container linked with MariaDB and PHPMyAdmin using `run.sh`

Now that the LAMP server’s running, visit with your Web browser :
1. http://127.0.0.1:8000/ for PHP environment,
2. http://127.0.0.1:8888/ to use PHPMyAdmin.

### Run
In order to (re)start the environment, use the [`run.sh`](run.sh) script.
```bash
$ ./run.sh
```
The environment is started as daemon. So it will be restarted on the workstation reboot.

### Stop
In order to stop the environment, use the [`stop.sh`](stop.sh) script.
```bash
$ ./stop.sh
```

All containers will be removed and recreated on then next run.

## Contributing

This image was created by [IPEOS](http://www.ipeos.com) for a purpose of web development training courses.

If you find this image useful here's how you can help:

* Send a Pull Request with your awesome enhancements and bug fixes
* Be a part of the community and help resolve Issues

## Team

### IPEOS

* [Laurent Vergerolle](https://github.com/psychoz971/)
* [Olivier Watté](https://github.com/owatte/)
