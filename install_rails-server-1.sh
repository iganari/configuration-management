#!/bin/bash
#
# created 2014/09/21

# install Ruby
## clone rbenb
cd 
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv

## setting bash
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

## reload bash
echo "let's type !"
echo "' source ~/.bash_profile ' "

exit
