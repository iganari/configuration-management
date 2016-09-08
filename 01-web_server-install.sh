#!/bin/bash
#
# create 2014/08/18

# #### NOTE #####
# running root !!
# ###############

# setting apache
yum install -y httpd httpd-devel

cp -a /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf.org
HOSTNAME=`hostname`
sed -i "s/#ServerName www\.example\.com:80/ServerName ${HOSTNAME}/g" /etc/httpd/conf/httpd.conf
service httpd restart
chkconfig httpd on

# Installation of service by remi
yum install -y --enablerepo=remi --enablerepo=remi-php56 php php-devel php-mysql php-mbstring php-gd php-pdo php-xml mysql-server mysql-devel mysql-utilities

# setting php
cp -a /etc/php.ini /etc/php.ini.org
sed -i "s/;mbstring.language = Japanese/mbstring.language = Japanese/g" /etc/php.ini
sed -i "s/;mbstring.internal_encoding = EUC-JP/mbstring.internal_encoding = UTF-8/g" /etc/php.ini
sed -i "s/;mbstring.http_input = auto/mbstring.http_input = auto/g" /etc/php.ini
sed -i "s/;mbstring.detect_order = auto/mbstring.detect_order = auto/g" /etc/php.ini
sed -i "s/expose_php = On/expose_php = Off/g" /etc/php.ini
sed -i "s/;date.timezone =/date.timezone = Asia\/Tokyo/g" /etc/php.ini
service httpd restart

# setting mysql
service mysqld start
chkconfig mysqld on

# setting index
cp ./source/index.php /var/www/html/

# create sudo user
echo 'adduser lassi -g wheel'
echo 'passwd lassi' 
