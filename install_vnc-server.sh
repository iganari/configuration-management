#!/bin/bash
#
# create 2015/01/20

# install VNC
yum install -y tigervnc-server pixman libXfont 

# install KVM
yum install -y qemu-kvm libvirt virt-manager virt-viewer
service   libvirtd restart
chkconfig libvirtd on

# install Bridge Utility
yum install -y bridge-utils
# cp -aupv /etc/sysconfig/network-scripts/ifcfg-eth0 /etc/sysconfig/network-scripts/ifcfg-br0
# cp -aupv /etc/sysconfig/network-scripts/ifcfg-eth1 /etc/sysconfig/network-scripts/ifcfg-br1

# setting vnc server user
echo 'VNCSERVERS="2:shuhei"' >>                 /etc/sysconfig/vncservers
echo 'VNCSERVERARGS[2]="-geometry 1280x960"' >> /etc/sysconfig/vncservers

# setting shuhei user
groupadd -g 109 family
adduser shuhei -g family -u 501
passwd shuhei


echo 'su -l shuhei'
echo 'vncpasswd'
echo 'exit'

# apply vnc server 
service vncserver restart
chkconfig vncserver on

# download centos image
wget -t 5 -v http://ftp.riken.jp/Linux/centos/6.6/isos/x86_64/CentOS-6.6-x86_64-bin-DVD1.iso 
