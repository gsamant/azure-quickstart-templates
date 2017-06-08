#!/bin/bash
apt-get -y update

# set up a silent install of MySQL
dbpass=$1

export DEBIAN_FRONTEND=noninteractive
echo mysql-server-5.6 mysql-server/root_password password $dbpass | debconf-set-selections
echo mysql-server-5.6 mysql-server/root_password_again password $dbpass | debconf-set-selections

# install the LAMP stack
apt-get -y install apache2 mysql-server 
apt-get -y install php7.0 libapache2-mod-php7.0 
apt-get install libapache2-mod-php7.0 php7.0-mysql

# write some PHP
echo \<center\>\<h1\>My Demo App\</h1\>\<br/\>\</center\> > /var/www/html/phpinfo.php
echo \<\?php phpinfo\(\)\; \?\> >> /var/www/html/phpinfo.php

# restart Apache
apachectl restart