# VIM development environment

# Requirement

OS: CentOS 7

## Installation

install requirement packages

```
yum install -y gcc git ncurses-devel
```

get source code

```
git clone https://github.com/vim/vim.git
```

make & install binary

```
cd vim/src
make
cp -f ./vim /usr/bin/
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
