#!/bin/bash
#
# created 2014/10/30

# ####### NOTE #######
# running sudo user !!
# ####################


cd /etc/yum.repos.d
sudo wget http://download.opensuse.org/repositories/isv:ownCloud:community/CentOS_CentOS-6/isv:ownCloud:community.repo

sed -i "s/enabled=1/enabled=0/g" /etc/yum.repos.d/isv\:ownCloud\:community.repo

sudo yum install --enablerepo=isv_ownCloud_community owncloud -y
mysql -uroot < ./source/owncloud.sql




