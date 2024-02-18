#!/usr/bin/env zsh

# eza config
alias ls="eza --long --all --color=always"

# less with color coding, quit when one screen
alias less="less -RF"

# 주어진 디렉토리에 ls 명령어를 수행하고 결과를 less로 표시하는 함수
# 전달하는 옵션은 모두 eza에 전달합니다.
function l {
  eza_options=$@
  ls $eza_options | less
}

# 입력한 포트를 사용할 수 있게 사용 중인 프로세스를 종료하는 명령어
function yield_port {
  port=$1
  pid=$(lsof -i:$port | grep "LISTEN" | awk '{ print $2 }')
  if [[ -z $pid ]]; then
    echo "Port not in use"
  else
    kill -QUIT $pid
    echo "Process using port $port has been terminated"
  fi
}

# base 브랜치로부터 변경 내역이 얼마나 많이 쌓였는지 확인하는 명령어
function diffwith {
  export CHECK_GIT_DIFF_LINE_THRESHOLD=600
  "$HOME/dotfiles/scripts/check-git-diff.js" $1 $2
}

# 현재 브랜치를 base로 하는 Pull Request 목록을 클립보드에 복사하는 명령어
function copy_pr {
  gh pr list \
    --state all \
    --json number \
    --jq "sort_by(.number) | .[].number" \
    --base $(git rev-parse --abbrev-ref HEAD) |
    sed 's/^/- #/' |
    pbcopy
}
