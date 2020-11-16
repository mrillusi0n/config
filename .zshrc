autoload -Uz compinit promptinit
compinit
promptinit

bindkey -v
bindkey '^r' history-incremental-search-backward

CASE_INSENSITIVE=true

# directory marks
alias lp="cd /Volumes/development/learn-programming/"
alias dev="cd /Volumes/development/"
alias tc="cd /Volumes/development/theteachr"

# commands
alias bp="bpython -q"
alias py="python3.8"

# setting prompt
PROMPT="%(?.%F{blue}.%F{red})$%f "
RPROMPT="%F{magenta}%1~"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
