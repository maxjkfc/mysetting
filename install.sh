#!/bin/bash
set -e 



setup_zshconfig(){
	
	echo "setting zsh config"

	if [ -f $HOME/.zshrc ]; then
		mv $HOME/.zshrc $HOME/.zshrc.backup
	fi
	ln -s $PWD/zsh/.zshrc $HOME/.zshrc

        if [ -d $HOME/.config/zsh ] || [ -L $HOME/.config/zsh ]; then
                rm -rf $HOME/.config/zsh
        fi

	ln -s $PWD/zsh/config $HOME/.config/zsh

}

setup_nvimconfig() {
	
	echo "setting nvim config"

        if [ -d $HOME/.config/nvim ] || [ -L $HOME/.config/nvim ]; then
                rm -rf $HOME/.config/nvim
        fi

        mkdir -p $HOME/.config
        ln -s $PWD/nvim $HOME/.config/nvim

}

case $1 in 
	zsh)
		setup_zshconfig
		;;
	nvim)
		setup_nvimconfig
		;;
	*)
		echo "not have corrent config";
		exit 0
		;;
esac
