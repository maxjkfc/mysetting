#!/bin/bash

set -e 



setup_zshconfig(){
	echo "setting zsh config"
	ln -s $PWD/zsh/.zshrc $HOME/.zshrc
	ln -s $PWD/zsh/config/* $HOME/.config/zsh
}


setup_zshconfig
