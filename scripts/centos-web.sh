#!/bin/bash
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

# Download Starter Content from GitHub
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/cho23657/cho23657-vagrant/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/cho23657/cho23657-vagrant/master/files/info.php
# Retart Apache
service httpd restart