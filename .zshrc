zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select

autoload -U compinit && compinit -C
zmodload zsh/complist 

setopt nocaseglob
setopt autocd

bindkey '^H' backward-kill-word
bindkey -M menuselect '^[[Z' reverse-menu-complete
bindkey "\e[1;5D" backward-word
bindkey "\e[1;5C" forward-word 

fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure

alias ls='lsd'
alias la='ls -lah'
alias n='nvim'

export PATH="$HOME/bin:$PATH"

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Created by `pipx` on 2026-05-13 10:53:29
export PATH="$PATH:/home/user/.local/bin"
