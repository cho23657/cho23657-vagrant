#!/bin/bash

# Update CentOS with any patches
yum update -y --exclude=kernel

# Tools
yum install -y nano git unzip screen

# Apache
yum install -y httpd httpd-devel httpd-tools
chkconfig --add httpd
chkconfig httpd on
service httpd stop

# Remove the main folder that apache serves from so that it can be replaced with :
# a symbolic link between the host /vagrant folder and the guest /var/www/html
rm -rf /var/www/html
ln -s /vagrant /var/www/html

# Start Apache
service httpd start

# Next install PHP
yum install -y php php-cli php-common php-devel php-mysql

# Next install MySQL
yum install -y mysql mysql-server mysql-devel
chkconfig --add mysqld
# Config MySQL to load on system startup
chkconfig mysqld on
service mysqld start
# Check that MySQL is started
mysql -u root -e "SHOW DATABASES"

# Download Starter Content

# Retart Apache
service httpd restart