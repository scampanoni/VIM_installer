#!/bin/bash

# Local variables
origDir="`pwd`" ;

# Fetch the VIM repository
if ! test -d vim ; then
  git clone https://github.com/vim/vim.git
else
  pushd ./ ;
  cd vim ;
  make clean ;
  git pull ;
  popd ;
fi

# Configure
cd vim ;
./configure --with-features=huge \
            --enable-multibyte \
            --enable-pythoninterp=yes \
            --with-python-config-dir=/usr/lib/python2.7/site-packages/firewall/config \
            --enable-python3interp=yes \
            --with-python3-config-dir=/opt/rh/rh-python34/root/usr/lib/python3.4/site-packages/sphinx/locale/.tx/config \
            --enable-cscope \
            --prefix=${origDir}/release

# Compile
make VIMRUNTIMEDIR=${origDir}/release/share/vim/vim81 -j16

# Install
make install 

echo "VIM_HOME=${origDir}/release" > ${origDir}/enable;
echo "export PATH=$VIM_HOME/bin:$PATH" >> ${origDir}/enable;
