#zplug 
source $HOME/.zplug/init.zsh
setopt prompt_subst # Make sure prompt is able to be generated properly.

zplug "romkatv/powerlevel10k", as:theme, depth:1
zplug "b4b4r07/enhancd", use:init.sh


zplug "wfxr/forgit"

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"

zplug "stedolan/jq", \
    from:gh-r, \
    as:command, \
    rename-to:jq
zplug "b4b4r07/emoji-cli", \
    on:"stedolan/jq"

#
zplug "supercrabtree/k"

# Load theme file
zplug 'dracula/zsh', as:theme

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

autoload -Uz compinit && compinit -i
