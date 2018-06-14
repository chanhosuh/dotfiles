export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

set -o vi


export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Work
source /anaconda3/bin/virtualenvwrapper.sh

source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh

# export PS1="\u@\h:\W $ "
export PS1='\[\e[32m\]\u@\h: \[\e[33m\]\w\[\e[0m\]$(__git_ps1)\n\$ '

alias ll='ls -hal'
alias lt='ls -halrt'

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

alias goo='googler --count 6 --colors egmkxm'
