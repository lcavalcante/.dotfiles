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
	tic -o $HOME/.terminfo $HOME/.dotfiles/xterm-256color.terminfo
	#git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	ln -s $HOME/.dotfiles/vimrc $HOME/.vimrc || true
    ln -s $HOME/.dotfiles/tmux.conf $HOME/.tmux.conf || true
    #rm -f $HOME/.gitconfig && ln -s $HOME/.dotfiles/gitconfig $HOME/.gitconfig || true
    #ln -s $HOME/.dotfiles/gitignore_global $HOME/.gitignore_global || true
    #ln -s $HOME/.dotfiles/NERDTreeBookmarks $HOME/.NERDTreeBookmarks || true
    #mkdir -p $HOME/.ssh && ln -s $HOME/.dotfiles/sshconf  $HOME/.ssh/config || true
    #rm -f $HOME/.bashrc && ln -s $HOME/.dotfiles/bashrc $HOME/.bashrc || true
    #rm -f $HOME/.bash_profile && ln -s $HOME/.dotfiles/bashrc $HOME/.bash_profile || true

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
