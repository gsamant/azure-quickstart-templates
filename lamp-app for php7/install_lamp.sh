#!/bin/bash
sudo apt-get -y update

# set up a silent install of MySQL
dbpass=$1

export DEBIAN_FRONTEND=noninteractive
sudo sh -c "echo mysql-server-5.6 mysql-server/root_password password $dbpass | debconf-set-selections"
sudo sh -c "echo mysql-server-5.6 mysql-server/root_password_again password $dbpass | debconf-set-selections"

# install the LAMP stack
sudo apt-add-repository ppa:ondrej/php
sudo apt-get update

sudo apt-get -y install apache2 
sudo apt-get -y install mysql-server 
sudo apt-get -y install php7.0
sudo apt-get -y install php7.0-mysql
#apt-get -y install phpmyadmin

# write some PHP
sudo sh -c "echo \<center\>\<h1\>My Demo App\</h1\>\<br/\>\</center\> > /var/www/html/phpinfo.php"
sudo sh -c "echo \<\?php phpinfo\(\)\; \?\> >> /var/www/html/phpinfo.php"

# restart Apache
sudo service apache2 restart