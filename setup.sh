#!/bin/sh

ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.vim ~/.vim
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.bash_profile

if [ ! -e ~/dotfiles/.vim/bundle ] ;then
	git clone git://github.com/Shougo/neobundle.vim ~/dotfiles/.vim/bundle/neobundle.vim
fi
