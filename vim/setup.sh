#bin/sh

BASE_DIR=$(pwd)

# install epel-release
yum install -y epel-release

# install requirement packages
yum install -y gcc git ncurses-devel ctags ruby ruby-devel lua lua-devel luajit luajit-devel ctags git python python-devel tcl-devel perl perl-devel perl-ExtUtils-ParseXS perl perl-devel perl-ExtUtils-ParseXS perl-ExtUtils-Embed

# download vim source code
mkdir -p $GOPATH/src/github.com/vim/vim
git clone https://github.com/vim/vim.git ~/go/src/github.com/vim/vim

# config,build and install
cd ~/go/src/github.com/vim/vim
sed -i 's/^# CONF_OPT_GUI.*/CONF_OPT_GUI = --disable-gui/' ./src/Makefile
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-pythoninterp=yes \
            --with-python-config-dir=/lib64/python2.7/config \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=gtk2 \
            --enable-cscope \
            --prefix=/usr/local
make VIMRUNTIMEDIR=/usr/local/share/vim/vim81 && make install

# copy .vimrc
cd $BASE_DIR
cp -f vim/.vimrc ~/.vimrc

# install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# get go tools
mkdir -p $GOPATH/src/golang.org/x
git clone git@github.com:golang/net.git $GOPATH/src/golang.org/x/net
git clone git@github.com:golang/sync.git $GOPATH/src/golang.org/x/sync
git clone git@github.com:golang/tools.git $GOPATH/src/golang.org/x/tools
