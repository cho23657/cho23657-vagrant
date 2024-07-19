#!/bin/bash
# Next install MySQL
yum install -y mysql mysql-server mysql-devel
chkconfig --add mysqld
# Config MySQL to load on system startup
chkconfig mysqld on
service mysqld start
# Check that MySQL is started
mysql -u root -e "SHOW DATABASES"