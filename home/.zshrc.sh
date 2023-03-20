#!/usr/bin/env zsh

dev="$HOME/Developer"
terminal="$HOME/dotfiles/terminal"

source "$terminal/highlight/setup.sh"
source "$terminal/completion/setup.sh"
source "$HOME/dotfiles/scripts/add-to-dotfiles.sh"

alias cl="clear"
alias permission="sudo chown -R $USER"
alias g="git"

# Register directory
hash -d dev="$dev"

if [[ "$OSTYPE" == darwin* ]]; then
  eval "$(starship init zsh)"
fi

# exa config
TIME_STYLE="iso"
export TIME_STYLE
alias ls="exa --header --long --all --color=always"

# less with color coding, quit when one screen
alias less="less -RF"

# 주어진 디렉토리에 ls 명령어를 수행하고 결과를 less로 표시하는 함수
# 아무 값이 없으면 현재 디렉토리를 표시합니다.
function l {
 directory=$1

 if [[ -z $directory ]]; then
   ls | less --header 1
 else
   ls $1 | less --header 1
 fi
}

# nvm configurations
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# 입력한 포트를 사용할 수 있게 사용 중인 프로세스를 종료하는 명령어
function yield_port {
  port=$1
  pid=$(lsof -i:$port | grep "LISTEN" | awk '{ print $2 }')
  if [[ -z $pid ]]; then
    echo "Port not in use"
  else
    kill $pid
    echo "Process using port $port has been terminated"
  fi
}
