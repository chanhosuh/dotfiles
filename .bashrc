export PATH="$HOME/bin:$HOME/.local/bin:/anaconda3/bin:$PATH"

set -o vi

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Work
# export VIRTUALENVWRAPPER_PYTHON=/anaconda3/bin/python
source /anaconda3/bin/virtualenvwrapper.sh

source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
export GIT_PS1_SHOWUPSTREAM="auto"

source ~/bin/.git-completion.bash

docker_ps1() {
  if [[ `docker ps -q` != "" ]]; then
    echo " 🐳"
  else
    echo
  fi
}
export PS1='\[\e[32m\]\u@\h: \[\e[33m\]\w\[\e[0m\]$(__git_ps1)$(docker_ps1)\n\$ '

alias ll='ls -hal'
alias lt='ls -halrt'

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

alias goo='googler --count 6 --colors egmkxm'

# --- port stuff --- #

# check ports listening
port-listeners() { lsof -i -P -n | grep LISTEN; }
# kill process on given port
kill-port() { kill -9 "$(lsof -t -i :$1)"; }

# --- GIT shortcuts --- #
alias git-log='git log --pretty=format:"%C(yellow)%h %C(green)%ar %C(auto)%d %Creset %s , %Cblue%an" --graph'
alias git-shortlog='git shortlog --format=format:"%h %s, %ar"'

alias git-refresh='git fetch && git-log --all'
alias git-summary='git fetch && git-shortlog --all'

alias git-refresh-day='git fetch && git-log --all --since="1 day ago"'
alias git-summary-day='git fetch && git-shortlog --all --since="1 day ago"'
# --- end GIT shortcuts --- #
