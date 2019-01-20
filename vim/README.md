# VIM development environment

# Requirement

OS: CentOS 7

## Installation

install requirement packages

```
yum install -y gcc git ncurses-devel ctags ruby ruby-devel lua lua-devel luajit luajit-devel ctags git python python-devel python3 python3-devel tcl-devel perl perl-devel perl-ExtUtils-ParseXS perl perl-devel perl-ExtUtils-ParseXS perl-ExtUtils-Embed
```

get source code

```
git clone https://github.com/vim/vim.git
```

make & install binary

```
cd vim
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
```
tips: Uncomment line `CONF_OPT_GUI = --disable-gui` in Makefile if you do not want GUI.

## Configuration

1. copy .vimrc to home directory
```
cp -f vim/.vimrc ~/.vimrc
```

2. open vim editor
```
vim ~/.vimrc
```

3. install plugin
```
:PluginInstall
```

4. reload vim
