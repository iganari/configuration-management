#!/bin/bash
#
# create 2014/08/18

# #### NOTE #####
# running root !!
# ###############

# difie Directory

basename=$(cd `dirname $0`; pwd)

# stop unnecessary service
service NetworkManager stop
service iptables stop
service ip6tables stop

# cancel unnecessary autostart
chkconfig iptables off
chkconfig ip6tables off

# remove unnecessary autostart
yum remove NetworkManager -y 

# upgrade centos
yum upgrade -y
yum update bash -y

# Installation of basic commands
yum install vim wget openssl openssl-devel tree telnet nkf mlocate expect ntp net-snmp net-snmp-utils -y


# Downloading and installing third-repository
yum install yum-plugin-priorities -y

cd /tmp
wget http://ftp.riken.jp/Linux/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm http://rpms.famillecollet.com/enterprise/remi-release-6.rpm http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
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

# Installation of basic commands from rpm
yum install --enablerepo=epel tig iftop htop -y

# setting date
rm /etc/localtime
ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

# settinf ntpd service
cp ${basename}/source/ntp.conf /etc/
chmod 644 /etc/ntp.conf
service ntpd restart
chkconfig ntpd on

# modify SELinux
sed -i "s/SELINUX=enforcing/SELINUX=disabled/g" /etc/selinux/config

# bash color custom
echo 'export PS1="\[\033[1;34m\][\t][\u@\h \W]\\$\[\033[0m\] "' >> /etc/profile 

# make /develop
mkdir /develop
chmod 777 /develop

# ---------------------------------------------------------- # 
###  # install Ruby
###  ## clone rbenb
###  cd
###  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
###  
###  ## setting bash
###  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
###  echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
###  
###  ## reload bash
###  ### source ~/.bash_profile
# ---------------------------------------------------------- # 


# reboot for setting reflected
reboot


