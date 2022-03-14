#!/bin/bash

# Local variables
origDir="`pwd`" ;
enableFileName=${origDir}/enable ;

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
#   Run 
#     $./configure --help
#   to see all options
cd vim ;
./configure --with-features=huge \
            --enable-multibyte \
            --enable-python3interp=yes \
            --enable-cscope \
            --enable-terminal   \
            --enable-fontset    \
            --prefix=${origDir}/release

# Compile
make VIMRUNTIMEDIR=${origDir}/release/share/vim/vim81 -j16

# Install
make install 

# Write the enable file
echo "#!/bin/bash" > ${enableFileName} ;
echo " " >> ${enableFileName} ;
echo "VIM_HOME=${origDir}/release" >> ${enableFileName} ;
echo "export PATH=\$VIM_HOME/bin:\$PATH" >> ${enableFileName} ;
