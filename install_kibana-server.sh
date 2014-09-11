#!/bin/bash
#
# created 2014/09/21


# install basic web server
/bin/bash -x install_web-server.sh

# install Elasticsearch
## for java
yum -y install java-1.7.0-openjdk

## get and install Elasticsearch
cd /tmp
wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.3.2.noarch.rpm
rpm -ivh elasticsearch-1.3.2.noarch.rpm

## start Elasticsearch and setting of autostart
service elasticsearch start
chkconfig elasticsearch on

# Fluentd


# Kibana
## get and build Kibana
cd /deploy/
wget http://download.elasticsearch.org/kibana/kibana/kibana-latest.zip
unzip kibana-latest.zip
mv kibana-latest kibana
ln -s /deploy/kibana/ /var/www/html/


