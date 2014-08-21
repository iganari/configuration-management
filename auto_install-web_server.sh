#!/bin/bash
#
# create 2014/08/18

# setting apache
yum install httpd -y

cp -a /etc/httpd/conf/httpd.conf /etc/httpd/conf/httpd.conf.org
HOSTNAME=`hostname`
sed -i "s/#ServerName www\.example\.com:80/ServerName $HOSTNAME/g" /etc/httpd/conf/httpd.conf
service httpd restart
chkconfig httpd on
