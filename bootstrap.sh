#!/bin/bash

set -e

# install base software and dependencies
function install_base () {
    apt install -y \
        apparmor \
        curl \
        git \
        htop \
        libapparmor-dev \
        make \
        tmux
}

# install development deps and setup vim, bash, and other dotfiles
function install_dev() {
    apt install --no-install-recommends -y \
        autoconf \
        bison \
        build-essential \
        ca-certificates \
        clang \
        ctags \
        indent \
        libc6-dev \
        libclang-dev \
        libtool \
        man-db \
        manpages-dev \
        tree \
        pkg-config \
        vim
}

function setup_home () {
    cd $HOME
    #rm -rf $HOME/.vim
    rm -rf $HOME/.vimrc
    rm -rf $HOME/.tmux.conf
	tic -o $HOME/.terminfo $HOME/.dotfiles/xterm-256color.terminfo
	#git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	ln -s $HOME/.dotfiles/vimrc $HOME/.vimrc || true
    ln -s $HOME/.dotfiles/tmux.conf $HOME/.tmux.conf || true
	apt install -y zsh 
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" | echo "Y"

}

# main entrypoint
case "$1" in
    "server")
        echo "installing server dependencies..."
        install_base
        ;;
    "dev")
        echo "installing development dependencies..."
        install_base
        install_dev
		setup_home
        source $HOME/.bashrc
        ;;
	"home")
		echo "Setup home dir..."
		setup_home
		;;
    *)
        ;;
esac
