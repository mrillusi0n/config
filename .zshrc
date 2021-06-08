autoload -Uz compinit promptinit
compinit
promptinit

bindkey -v
bindkey '^r' history-incremental-search-backward

CASE_INSENSITIVE=true

alias ..='cd ..'
alias ...='cd ../..'

# commands
alias bp="bpython -q"
alias py="python3.8"

# setting prompt
PROMPT="%(?.%F{blue}.%F{red})$%f "
RPROMPT="%F{magenta}%1~"

function pi () {
	sudo pacman -S "$1"
}

export PATH=$PATH:$HOME/.local/bin
