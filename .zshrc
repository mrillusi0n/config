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
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
