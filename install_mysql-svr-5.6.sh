#!/bin/bash
#
# create 2015/06/04

# #### NOTE #####
# running root !!
# ###############

### get rpm mysql

cd /tmp
wget http://dev.mysql.com/get/Downloads/MySQL-5.6/MySQL-client-5.6.20-1.el6.x86_64.rpm http://dev.mysql.com/get/Downloads/MySQL-5.6/MySQL-shared-compat-5.6.20-1.el6.x86_64.rpm http://dev.mysql.com/get/Downloads/MySQL-5.6/MySQL-server-5.6.20-1.el6.x86_64.rpm http://dev.mysql.com/get/Downloads/MySQL-5.6/MySQL-devel-5.6.20-1.el6.x86_64.rpm http://dev.mysql.com/get/Downloads/MySQL-5.6/MySQL-shared-5.6.20-1.el6.x86_64.rpm

yum -y install MySQL-{client,devel,server,shared-compat}-5.6.20-1.el6.x86_64.rpm
yum -y install MySQL-shared-5.6.20-1.el6.x86_64.rpm

### setting mysql
service   mysql start
chkconfig mysql on


mysql --version

### modify mysql root password

mydb_default_passwd=`cat /root/.mysql_secret | cut -d \  -f19`

cat << __EOT__ > /etc/.my.cnf
[client]
user = root
password = ${mydb_default_passwd}
host = localhost
__EOT__

mysql --defaults-extra-file=/etc/.my.cnf  << __EOT__
SET PASSWORD FOR root@localhost=PASSWORD('password');
exit
__EOT__

