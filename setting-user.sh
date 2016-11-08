#!/bin/bash

# ----------
# run root !
# ----------

echo "Do you want to what the name of wheel user name ? (e.g. lassi)"
read u_name

echo "Plz setting ${u_name}'s password (e.g. qwertyuiop)"
read u_passwd

### create user
adduser ${u_name} -g wheel
### setting password using here document
passwd ${u_name} << EOS
${u_passwd}
${u_passwd}
EOS

### sudo setting 
chmod 755 /etc/sudoers
sed -i "105a %wheel ALL=(ALL) NOPASSWD: ALL" /etc/sudoers
chmod 440 /etc/sudoers

### limited the account to become root
sed -i "6a auth           required        pam_wheel.so use_uid"       /etc/pam.d/su
sed -i "4a auth           sufficient      pam_wheel.so trust use_uid" /etc/pam.d/su

### Reject root login
sed -i "42a PermitRootLogin no"        /etc/ssh/sshd_config
# service sshd reload

### Reject password login
sed -i "54a PasswordAuthentication no" /etc/ssh/sshd_config

### setting server
service sshd reload
