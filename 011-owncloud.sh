#!/bin/bash
#
# created 2014/10/30

# ####### NOTE #######
# running sudo user !!
# ####################

# difine Directory
Dir=`pwd`

cd /etc/yum.repos.d
sudo wget http://download.opensuse.org/repositories/isv:ownCloud:community/CentOS_CentOS-6/isv:ownCloud:community.repo

sed -i "s/enabled=1/enabled=0/g" /etc/yum.repos.d/isv\:ownCloud\:community.repo

sudo yum install --enablerepo=remi,isv_ownCloud_community owncloud -y
sudo serviec httpd restart
mysql -uroot < $Dir/source/owncloud.sql




