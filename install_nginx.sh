#!/bin/bash


### get nginx repo rpm && registration
rpm -ivh http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm

### install nginx from yum repo
yum install -y nginx 
service nginx start

### nginx status check

echo 'nginx status is'
# curl -LI localhost -o /dev/null -w '%{http_code}\n' -s
echo -e "\n\n" && curl -LI localhost && echo -e "\n"

