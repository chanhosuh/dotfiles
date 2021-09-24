export PATH="$HOME/bin:$HOME/.local/bin:$HOME/.cargo/bin:${PATH}"
export PATH="${PATH}:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

PYTHON_HOME=/Library/Frameworks/Python.framework/Versions/3.8/bin
export PATH="${PYTHON_HOME}:${PATH}"

export CDPATH=.:$HOME:$HOME/git

# remove annoying OS X bash deprecation warning
export BASH_SILENCE_DEPRECATION_WARNING=1

set -o vi

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Work
export VIRTUALENVWRAPPER_PYTHON=${PYTHON_HOME}/python3
source ${PYTHON_HOME}/virtualenvwrapper.sh

source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
export GIT_PS1_SHOWUPSTREAM="auto"

source $HOME/bin/.git-completion.bash
# use extended `cd` command from:
# https://linuxgazette.net/109/marinov.html
source $HOME/bin/acd_func.sh

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

docker_ps1() {
  ids=`docker ps -q 2>/dev/null`
  if [[ "${ids}" != "" ]]; then
    echo " 🐳"
  else
    echo
  fi
}
export PS1='\[\e[32m\]\u@\h: \[\e[33m\]\w\[\e[0m\]$(__git_ps1)$(docker_ps1)\n\$ '
# export PS1='\[\e[32m\]\u@\h: \[\e[33m\]\w\[\e[0m\]$(__git_ps1)\n\$ '

alias ll='ls -hal'
alias lt='ls -halrt'

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

alias goo='googler --count 6 --colors egmkxm'

# --- GIT shortcuts --- #
alias git-log='git log --pretty=format:"%C(yellow)%h %C(green)%ar %C(auto)%d%Creset, %Cblue%an %Creset%n""        %s" --graph'
# alias git-log='git log --pretty=format:"%C(yellow)%h %C(green)%ar %C(auto)%d %Creset %s , %Cblue%an" --graph'
alias git-shortlog='git shortlog --format=format:"%h %s, %ar"'

alias git-refresh='git fetch && git-log --all'
alias git-summary='git fetch && git-shortlog --all'

alias git-refresh-day='git fetch && git-log --all --since="1 day ago"'
alias git-summary-day='git fetch && git-shortlog --all --since="1 day ago"'

alias git-status='git status --porcelain'

alias git-merges='git log --merges --first-parent --pretty=format:"%h %<(10,trunc)%aN %C(white)%<(15)%ar%Creset %C(red bold)%<(15)%D%Creset %s"'

alias git-branch='git branch -vv --sort=-committerdate'
# --- end GIT shortcuts --- #

# --- custom commands --- #

# check ports listening
port-listeners() { lsof -i -P -n | grep LISTEN; }
# kill process on given port
kill-port() { kill -9 "$(lsof -t -i :$1)"; }

# show top processes with given name
top-process() {
    top -pid $(pgrep $1 | sed -e ':a' -e 'N' -e '$!ba' -e 's/\n/ -pid /g');
}

timestamp() {
    date +%s
}

string-length() {
    python3 -c "print(len('$1'))";
}

# convert between eth and wei
to-wei() {
    python3 -c "from decimal import Decimal as D;  print((D('$1') * D('1' + '0' * 18)).quantize(D('1')))"
}
from-wei() {
    python3 -c "from decimal import Decimal as D;  print(D('$1') / D('1' + '0' * 18))"
}

coingecko() {
    echo $(curl -s "https://api.coingecko.com/api/v3/simple/price?ids=$1&vs_currencies=usd")
}


source local_env_vars
ssh-ec2() { ssh -i $HOME/ssh/${PEM_KEY} ${EC2_HOST}; }

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.bash.inc" ]; then . "$HOME/google-cloud-sdk/path.bash.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.bash.inc" ]; then . "$HOME/google-cloud-sdk/completion.bash.inc"; fi

compile-solidity() {
    solc @openzeppelin/=$(pwd)/node_modules/@openzeppelin/ @chainlink/=$(pwd)/node_modules/@chainlink/ contracts/**/*.sol --allow-paths=$(pwd) --optimize --optimize-runs=999999
}
