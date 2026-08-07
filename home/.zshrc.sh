#!/usr/bin/env zsh

# Prompt Customization
if [[ "$OSTYPE" == darwin* ]]; then
  eval "$(starship init zsh)"
fi

# PATH 중복 항목 자동 제거
typeset -U path PATH

# nvm configurations
# nvm.sh 로드는 셸 기동에 600ms 이상 들기 때문에 하지 않고,
# default 별칭이 가리키는 버전만 PATH에 등록한다. (외부 프로세스 없이 glob으로 해석)
export NVM_DIR="$HOME/.nvm"
if [[ -r "$NVM_DIR/alias/default" ]]; then
  _nvm_def="${"$(<"$NVM_DIR/alias/default")"}"
  _nvm_bin=("$NVM_DIR/versions/node/v${_nvm_def}"*(/Nn[-1]))
  [[ -n "$_nvm_bin" ]] && path=("${_nvm_bin[1]}/bin" $path)
  unset _nvm_def _nvm_bin
fi

# nvm 명령을 실제로 사용할 때만 로드한다.
nvm() {
  unfunction nvm
  \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  nvm "$@"
}

terminal="$HOME/dotfiles/terminal"
source "$terminal/highlight/setup.sh"
source "$terminal/completion/setup.sh"
source "$terminal/functions.sh"
source "$HOME/dotfiles/scripts/add-to-dotfiles.sh"

[[ -f "$HOME/dotfiles/home/company.zshrc.sh" ]] && source "$HOME/dotfiles/home/company.zshrc.sh"

# Alias
alias cl="clear"
alias g="git"
alias pn="pnpm"

# Register directory
dev="$HOME/Developer"
hash -d dev="$dev"

# AI Agent 비용 최적화를 위해 최대 라인수 제한
export BASH_MAX_OUTPUT_LENGTH=15000

# 인증 토큰 설정
export GITHUB_PAT=$(security find-generic-password -a "$USER" -s "GITHUB_PAT" -w)
export NODE_AUTH_TOKEN=$GITHUB_PAT
