#!/usr/bin/env zsh

dev="$HOME/Developer"

alias cl="clear"
alias permission="sudo chown -R $USER"
alias g="git"

if [[ "$OSTYPE" == darwin* ]]; then
  alias g-br-clear="git br -vv | grep gone | sed | cut -f 3 -d ' ' | xargs -n 1 git br -D"
fi

# Prompt Customization
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST
hash -d dev="$dev"
PROMPT='%F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '
