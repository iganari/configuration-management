#!/bin/bash


user=`whoami`

if [ ${user} = 'root' ]; then
  ### install elasticsearch in local source
  basepath=$(cd `dirname $0`; pwd)
 
  for i in `find ${basepath} -name "?-install-*" | sort`
    do
      echo "run ${i}"
      # sh ${i}
    done
else
  echo "require root"
fi 
