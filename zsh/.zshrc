if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# for tmux 
[[ $TMUX = "" ]] && export TERM="xterm-256color"

ZSH_THEME="dracula"


# You may need to manually set your language environment
export LANG=en_US.UTF-8
# 設定預設編輯器
export EDITOR='nvim'
# 設定配置檔
export myzshconfig="$HOME/.config/zsh"
export HISTSIZE=1000

# set the shell 
set -o emacs

# 讀取配置檔
# 路徑相關配置檔
test -e "${myzshconfig}/path.zsh"       && source "${myzshconfig}/path.zsh"
# zplug 配置檔
test -e "${myzshconfig}/zplug.zsh"      && source "${myzshconfig}/zplug.zsh"
# 別名相關配置檔
test -e "${myzshconfig}/alias.zsh"      && source "${myzshconfig}/alias.zsh"
# 插件相關配置檔
test -e "${myzshconfig}/plugin.zsh"     && source "${myzshconfig}/plugin.zsh"
# 客制語法配置檔
test -e "${myzshconfig}/shell.zsh"      && source "${myzshconfig}/shell.zsh"
# 主題配置檔
test -e "${myzshconfig}/theme.zsh"      && source "${myzshconfig}/theme.zsh"
# FZF配置檔
test -e "${myzshconfig}/fzf.zsh"        && source "${myzshconfig}/fzf.zsh"


echo $fg[blue]
echo ' ███╗   ███╗ █████╗ ██╗  ██╗     ██╗██╗  ██╗███████╗ ██████╗	'
echo '████╗ ████║██╔══██╗╚██╗██╔╝     ██║██║ ██╔╝██╔════╝██╔════╝	'	
echo '██╔████╔██║███████║ ╚███╔╝      ██║█████╔╝ █████╗  ██║     	'
echo '██║╚██╔╝██║██╔══██║ ██╔██╗ ██   ██║██╔═██╗ ██╔══╝  ██║      	'
echo '██║ ╚═╝ ██║██║  ██║██╔╝ ██╗╚█████╔╝██║  ██╗██║     ╚██████╗	'
echo '╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚════╝ ╚═╝  ╚═╝╚═╝      ╚═════╝	'

# for linux homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
