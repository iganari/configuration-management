#!/bin/bash
#
# create 2014/11/17

# #### NOTE #####
# running root !!
# ###############

USER='lassi'
PASSWD='318'

CREATEPASS=`perl -e "print(crypt('********', '**'));"`


# add user
# useradd ${USER} -g wheel -p `cat ./source/user-passwd`
useradd -p ${CREATEPASS} ${USER}
