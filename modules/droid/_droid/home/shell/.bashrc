# ─────────────────────────────────────────────
# Environment
# ─────────────────────────────────────────────

#export USER="${USER:-$(id -un)}"
#export EDITOR="${EDITOR:-nvim}"
#export VISUAL="${VISUAL:-$EDITOR}"

# Termux locale
#if [[ -n "${TERMUX_VERSION:-}" ]]; then
#  export LANG="${LANG:-C.UTF-8}"
#  export LC_CTYPE="${LC_CTYPE:-C.UTF-8}"
#  unset LC_ALL
#fi

# ─────────────────────────────────────────────
# History
# ─────────────────────────────────────────────

HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=20000
HISTTIMEFORMAT='%F %T  '
HISTIGNORE='ls:ll:la:l:pwd:clear:c:exit'

shopt -s histappend

# ─────────────────────────────────────────────
# Shell options
# ─────────────────────────────────────────────

shopt -s globstar
shopt -s cdspell
shopt -s checkwinsize
# shopt -s autocd
set -o vi

# ─────────────────────────────────────────────
# ble.sh
# ─────────────────────────────────────────────

if [[ -f ~/.local/share/blesh/ble.sh ]]; then
  source ~/.local/share/blesh/ble.sh
fi

# ─────────────────────────────────────────────
# Aliases
# ─────────────────────────────────────────────

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias c='clear'

if command -v grep >/dev/null 2>&1; then
  alias grep='grep --color=auto'
fi

if command -v diff >/dev/null 2>&1; then
  alias diff='diff --color=auto'
fi

# ─────────────────────────────────────────────
# fzf
# ─────────────────────────────────────────────

if command -v fzf >/dev/null 2>&1; then
  if fzf --bash >/dev/null 2>&1; then
    source <(fzf --bash)
  fi
fi

# ─────────────────────────────────────────────
# zoxide
# ─────────────────────────────────────────────

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init bash)"
fi

# ─────────────────────────────────────────────
# Starship
# ─────────────────────────────────────────────

if command -v starship >/dev/null 2>&1; then
  eval "$(starship init bash)"
fi

