#!/bin/bash
#
# create 2015/01/20

# install VNC
yum install -y tigervnc-server pixman libXfont 

# install KVM
yum install -y qemu-kvm libvirt virt-manager virt-viewer

# install Bridge Utility
yum install -y bridge-utils

echo 'VNCSERVERS="2:shuhei"' >>                 /etc/sysconfig/vncservers
echo 'VNCSERVERARGS[2]="-geometry 1280x960"' >> /etc/sysconfig/vncservers

groupadd -g 109 family
adduser shuhei -g family -u 501
passwd shuhei


echo 'su -l shuhei'
echo 'vncpasswd'
echo 'exit'

# apply vnc server 
service vncserver restart
chkconfig vncserver on 
