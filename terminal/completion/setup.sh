fpath=("${0:h}/source/src" $fpath)

autoload -Uz compinit && compinit -i

#
# Options
#

setopt COMPLETE_IN_WORD # Complete from both ends of a word.
setopt ALWAYS_TO_END    # Move cursor to the end of a completed word.
setopt PATH_DIRS        # Perform path search even on command names with slashes.
setopt AUTO_MENU        # Show completion menu on a succesive tab press.
setopt AUTO_LIST        # Automatically list choices on ambiguous completion.
setopt AUTO_PARAM_SLASH # If completed parameter is a directory, add a trailing slash.
unsetopt MENU_COMPLETE  # Do not autoselect the first completion entry.
unsetopt FLOW_CONTROL   # Disable start/stop characters in shell editor.

#
# Styles
#

# Use caching to make completion for commands such as dpkg and apt usable.
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "${ZDOTDIR:-$HOME}/.zcompcache"

# Case-insensitive (all), partial-word, and then substring completion.
if zstyle -t ':prezto:module:completion:*' case-sensitive; then
  zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
  setopt CASE_GLOB
else
  zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
  unsetopt CASE_GLOB
fi

# Group matches and describe.
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

# Fuzzy match mistyped completions.
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
