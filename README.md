# Local Development Environment

This repository provides a development environment for use with Magento 1.x and Magento 2.x projects.

The following containers will run on your local when the default environment is up:

App | Container Name | Ports
--- | --- | ---
nginx | nginx | 80
MySQL | mysql | 3306
redis | 6379 | 6379
Adminer | adminer | 8080
PHP 7.0 | php70 | n/a
PHP 7.1 | php70 | n/a
PHP 5.6 | php70 | n/a

There are other environments available for specific use cases which may also run the below containers:

App | Container Name | Ports
--- | --- | ---
PHP 7.2 | php72 | n/a
postgres | postgres | 5432
elasticsearch | elasticsearch | n/a
rabbitmq 3.6 | rabbitmq | 15672

## Setup

### Environment

The environment requires projects to be placed in the following folders:

* ```~/projects/environment``` - The location of this repository
* ```~/projects/magento1``` - Magento 1.x projects
* ```~/projects/magento2``` - Magento 2.x projects
* ```~/storage``` - Optional storage mount point (e.g. for media)

Projects should be cloned in one of the Magento folders, with the folder name the same as the repository slug in Bitbucket. Example: ```~/projects/magento2/discount-party-supplies```

There is a bash aliases file ```./bash_aliases``` which should be included in your ```~/.bashrc``` file which provides useful aliases to work within this environment.

After the above is set up, use the ```./build.sh``` script to download and build all required Docker images.

Hostnames can be found in ```./config/global/hosts``` which should be added to your ```/etc/hosts```.

### nginx

Configuration for nginx should be placed in ```./config/nginx/sites-available``` and committed to version control.

When nginx is running, you can then shell in to the nginx container and symlink in available sites to the ```/etc/nginx/sites-enabled``` folder from ```/etc/nginx/sites-available```. Alternatively you can copy the configuration file manually from the sites-enabled folder in to sites-available. Afterwards, restart site services using the ```./restart.sh``` script to activate the config.

### composer

Your composer auth.json file should be placed in ```./data/composer```. The ```/data/composer``` directory will be mounted to ```/home/www/.composer``` when the containers start.

Composer cache files will end up in ```./data/composer/cache```.

## Usage

### Starting / Stopping the environment

There's a collection of bash scripts which can be used to start/stop different environments. Each script can take an additional docker-compose file parameter to run different setups, e.g. ```./start.sh oro``` will run the ```docker-compose.oro.yml``` file.

### Running composer / php commands

All php commands should be run inside the docker containers, not on your local computer.

To run php commands, first shell in to one of the php versions, depending on your project. If you have configured your bash aliases, you should be able to use one of the php commands such as ```php71```.

The following commands are available:

* ```php70```
* ```php71```
* ```php72```
* ```php56```
* ```nginxdocker``` - used for nginx container

Once you are inside the container you should be the ```www``` user. You can then change directory to your project, e.g. ```cd ~/projects/magento2/discount-party-supplies/src```. From there you can run composer commands as normal e.g. ```composer install``` or run the Magento 2 commandline ```php bin/magento```.

#### Useful Aliases / Utilities

The following utilities are available in the relevant php containers:

* n98-magerun
* n98-magerun2

The php containers mount in the ```./config/global/bashrc``` file which contains some useful aliases that can be used while instide the php containers.

Alias | Description
--- | ---
devaccount | Adds an admin account (developer)

### Installing Magento

If you are installing Magento using the Web UI, ensure the database host is set to ```mysql```. This is resolved from within the container to the IP address of the mysql container.

If editing an existing Magento project ```env.php``` or ```local.xml``` file, ensure you have ```mysql``` as the database host.

### MySQL & Adminer

The default MySQL root password is ```password```.

Adminer should be available for quickly viewing the database on ```http://127.0.0.1:8080```.

Mysql can be connected to from the commandline, however you must specify the host e.g. ```mysql -u root -p -h 127.0.0.1```.