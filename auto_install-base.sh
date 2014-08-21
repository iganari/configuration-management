#!/bin/bash
#
# create 2014/08/18

# upgrade centos
yum upgrade -y

# stop unnecessary service
service NetworkManager stop
service iptables stop
service ip6tables stop

# cancel unnecessary autostart
chkconfig iptables off
chkconfig ip6tables off
chkconfig cups off

# remove unnecessary autostart
yum remove NetworkManager -y 

# Downloading and installing third-repository
yum install yum-plugin-priorities -y
cd /tmp
wget http://ftp-srv2.kddilabs.jp/Linux/distributions/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm http://rpms.famillecollet.com/enterprise/remi-release-6.rpm http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
rpm -ivh *.rpm

# Rewriting of Priority
cp -a /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.org
sed -i "s/enabled=1/enabled=0/g" /etc/yum.repos.d/epel.repo
sed -i "s/enabled = 1/enabled = 0/g" /etc/yum.repos.d/rpmforge.repo
sed -i "19i\enabled = 1" /etc/yum.repos.d/CentOS-Base.repo
sed -i "28i\enabled = 1" /etc/yum.repos.d/CentOS-Base.repo
sed -i "37i\enabled = 1" /etc/yum.repos.d/CentOS-Base.repo

# update third-repository
yum --enablerepo=epel update epel-release -y 
yum --enablerepo=remi update remi-release -y 
yum --enablerepo=rpmforge update rpmforge-release -y 

# Installation of basic commands
yum install tree telnet nkf mlocate expect ntp -y

# Installation of basic commands
yum install --enablerepo=epel tig -y

# Installation of service
yum --enablerepo=remi install php php-devel php-mysql php-mbstring php-gd mysql-server mysql-devel mysql-utilities -y

# modify SELinux
sed -i "s/SELINUX=enforcing/SELINUX=disabled/g" /etc/sysconfig/selinux

# bash cumtom
echo 'export PS1="\[\033[1;34m\][\t][\u@\h \W]\\$\[\033[0m\] "' >> /etc/profile 

# # reboot for setting reflected
# reboot

