#!/bin/bash

echo "Do you want to what the name of your user name ? (e.g. lassi)"
read u_name

echo "Plz setting ${u_name}'s password (e.g. qwertyuiop)"
read u_passwd

echo "adduser ${u_name} -g wheel"
echo "passwd lassi ${u_passwd}"
