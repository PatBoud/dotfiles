# ls
alias l='ls -lF --group-directories-first'
alias ll='ls -alF --group-directories-first'

# Docker
alias d="sudo docker ps -a --format 'table {{.Image}}\t{{ .Names }}\t{{.Status}}'"
alias dc="sudo docker-compose"

# Tmux
alias t="tmux"
alias ta="t attach"
alias tls="t ls"
alias tn="t new -s"
alias tm="~/tm.sh"

# Update Ubuntu
#alias upd="sudo apt update && sudo apt full-upgrade"

# Update Alpine
alias upd="sudo apk update && sudo apk upgrade"


# Prompt (Généré avec https://scriptim.github.io/bash-prompt-generator/)
PS1='\[\e[0;38;5;34m\]\u\[\e[0;38;5;253m\]@\[\e[0;38;5;179m\]\h\[\e[0;38;5;253m\]:\[\e[0;38;5;32m\]\w\[\e[0m\]\$\[\e[0m\] '
