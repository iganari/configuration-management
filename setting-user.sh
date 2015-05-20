#!/bin/bash

echo "Do you want to what the name of your user name ? (e.g. lassi)"
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
