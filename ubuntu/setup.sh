#!/bin/sh

# configs

BASE_DIR=$(pwd)
DRY_RUN=false

setup_vim(){
        vim_prefix="[vim]"
        echo "---"
        echo $vim_prefix start setup

        # install vundle
        execute $vim_prefix "apt install -y ctags"
        execute $vim_prefix "git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim"
        execute $vim_prefix "cp vim/.vimrc $HOME/.vimrc"
        execute $vim_prefix "vim +PluginInstall +GoInstallBinaries +qall > /dev/null"

        echo $vim_prefix end setup
}

setup_apt(){
        apt_prefix="[apt]"
        echo "---"
        echo $apt_prefix start setup

        # using tsinghua source
        execute $apt_prefix "cp $BASE_DIR/apt/sources.list.tsinghua /etc/apt/sources.list"
        execute $apt_prefix "apt update"

        echo $apt_prefix end setup
}

setup_golang(){
        golang_prefix="[golang]"
        echo "---"
        echo $golang_prefix start setup

        # install golang by apt
        execute $golang_prefix "apt install -y golang-go"
        execute $golang_prefix "go env -w GOPROXY=https://goproxy.io,direct"
        lineinfile "export GOPATH=$HOME/go" "$HOME/.bashrc"
        lineinfile "export PATH="'$PATH'":$HOME/go/bin" "$HOME/.bashrc"
        echo $golang_prefix please relogin
        
        echo $golang_prefix end setup
}

setup_podman(){
        podman_prefix="[podman]"
        echo "---"
        echo $podman_prefix start setup

        execute $podman_prefix ". /etc/os-release"
        execute $podman_prefix "echo 'deb https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${VERSION_ID}/ /' > /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list"
        execute $podman_prefix "curl -L https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${VERSION_ID}/Release.key | apt-key add -"
        execute $podman_prefix "apt update"
	apt_params=""
        execute $podman_prefix "apt install -y podman"
        execute $podman_prefix "cp podman/registries.conf /etc/containers/registries.conf"

        echo $podman_prefix end setup
}

setup_tools(){
        tools_prefix="[tools]"
        echo "---"
        echo $tools_prefix start setup

        execute $tools_prefix "apt install -y cloc zsh"

        echo $tools_prefix end setup
}

# execute command with log output
# $1 the prefix text
# $2 the command
execute(){ 
        echo $1 $2
        if ! $DRY_RUN;then
                eval $2
        fi
}

# make sure line in file
# $1 line text
# $2 file path
lineinfile(){
        if ! cat $2 > /dev/null; then
                echo "$1" >> $2
        elif ! grep "$1" $2 > /dev/null; then
                sed -i '$a '"$1" $2
        fi
}

main(){
        setup_apt
	setup_tools
        setup_golang
        setup_podman
        setup_vim
}

main 
