#!/bin/bash
#
# created 2014/09/21


# install basic web server
/bin/bash -x install_web-server.sh
sleep 20

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
## install Fluentd
curl -L http://toolbelt.treasuredata.com/sh/install-redhat.sh | sh
## change permisson
chmod 755 /var/log/httpd
## install fluent-plugin-elasticsearch
yum -y install gcc libcurl-devel
/usr/lib64/fluent/ruby/bin/fluent-gem install fluent-plugin-elasticsearch

## start td-agent and setting of autostart
service td-agent start
chkconfig td-agent on



# Kibana
## get and build Kibana
cd /deploy/
wget http://download.elasticsearch.org/kibana/kibana/kibana-latest.zip
unzip kibana-latest.zip
mv kibana-latest kibana
ln -s /deploy/kibana/ /var/www/html/


