#!/bin/bash 
#
# create 2014/09/24

/bin/bash -x install_web-server.sh
sleep 20

# install Elasticsearch
## install java
yum install java-1.7.0-openjdk

## install Elasticsearch latest
cd /tmp
wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.3.2.noarch.rpm
rpm -ivh elasticsearch-1.3.2.noarch.rpm

## start and autoboot
service elasticsearch start
chkconfig elasticsearch on


# install Fluentd

# install Kibana
## installation of kibana
cd /deploy/
wget http://download.elasticsearch.org/kibana/kibana/kibana-latest.zip
unzip kibana-latest.zip
mv kibana-latest kibana
ln -s /deploy/kibana/ /var/www/html/

