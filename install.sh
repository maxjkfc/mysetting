#!/bin/bash

set -e 



setup_zshconfig(){


	echo "setting zsh config"
	ln -s $PWD/zsh/.zshrc $HOME/.zshrc
	ln -s $PWD/zsh/config/* $HOME/.config/zsh

    # install zplug [https://github.com/zplug/zplug]
    brew install zplug

    # reload zsh
    source $HOME/.zshrc
}


setup_nvim(){
    if [[ $(which nvim) == *"not found"* ]]; then 
      brew install neovim
      pip3 install neovim
      npm install neovim
    fi


    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


    ln -s $PWD/nvim $HOME/.config/nvim

    nvim -c "PlugInstall"

}



