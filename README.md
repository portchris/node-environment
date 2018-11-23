# LENNS Environment

Linux Express.Js Node.Js Nginx PostgreSQL Stack

The following containers will run when the default environment is up:

App | Container Name | Ports
--- | --- | ---
Nginx | nginx | 80
PostgreSQL | postgres | 5432
Node.Js | adminer | 80/3000

## Setup
First, create the following environment configuration files:
```
env/nginx/.env
env/nodejs/.env
env/postgres/.env
```

Next, create the ```src``` directory where our projects will be placed:
```
mkdir src
```

Next, run the handy ```./build.sh``` or ```.\build.ps1``` script to download and build all required Docker images.

Finally, run the ```./start.sh``` or ```.\start.ps1``` script to bring up the containers.

### Environment

You must create the environment files ```env/nginx/.env, env/nodejs/.env & env/postgres/.env``` - this file will be used as the central location for credentials for our containers such the database username and password.

The environment requires projects to be placed in the ```src``` folder as this is where Docker mounts it's volumes.

There is a bash aliases file ```./bash_aliases``` which should be included in your ```~/.bashrc``` file which provides useful aliases to work within this environment.

Hostnames can be found in ```./config/global/hosts``` which should be added to your ```/etc/hosts```.

### Nginx

Configuration for nginx should be placed in ```./config/nginx/sites-available``` and committed to version control.

When nginx is running, you can then shell in to the nginx container and symlink in available sites to the ```/etc/nginx/sites-enabled``` folder from ```/etc/nginx/sites-available```. Alternatively you can copy the configuration file manually from the sites-enabled folder in to sites-available. Afterwards, restart site services using the ```./restart.sh``` or ```.\restart.ps1``` script to activate the config.

## Usage

### Starting / Stopping the environment



### Running NPM

Once you are inside the container you should be the ```www``` user. You can then change directory to your project, e.g. ```cd ~/projects/magento2/discount-party-supplies/src```. From there you can run composer commands as normal e.g. ```composer install``` or run the Magento 2 commandline ```php bin/magento```.

#### Useful Aliases / Utilities

The php containers mount in the ```./config/global/bashrc``` file which contains some useful aliases that can be used while instide the php containers.

Alias | Description
--- | ---
devaccount | Adds an admin account (developer)

### PostgresSQL

The default MySQL root password is ```password```.

Adminer should be available for quickly viewing the database on ```http://127.0.0.1:8080```.

Mysql can be connected to from the commandline, however you must specify the host e.g. ```mysql -u root -p -h 127.0.0.1```.
