#!/usr/bin/env zsh

# Enable pasting code into the terminal without the shell complaining about\
# the pasted prompt symbols
alias %= \$=

# zmv lets you batch rename (or copy or link) files by using pattern matching.
# https://zsh.sourceforge.io/Doc/Release/User-Contributions.html#index-zmv
autoload -Uz zmv
alias zmv='zmv -Mv'
alias zcp='zmv -Cv'
alias zln='zmv -Lv'

alias e='${(z)VISUAL:-${(z)EDITOR}}'
alias type='type -a'

alias cp="${aliases[cp]:-cp} -i"
alias ln="${aliases[ln]:-ln} -i"
alias mv="${aliases[mv]:-mv} -i"
alias rm="${aliases[rm]:-rm} -i"

# ls
alias sl='ls'                  # Correction for common spelling error.
alias ls="${aliases[ls]:-exa}" # TODO: check if exa installed

alias l='ls --oneline --all'   # one column, + hidden files.
alias ll='ls --long --header'  # long format
alias lr='ll --recurse'        # human readable sizes, recursively.
alias la='ll --all'            # long format, + hidden files.
alias lm='la | "$PAGER"'       # long format, + hidden files, through pager.
alias lk='ll --sort=size'      # sorted by size (largest last)
alias lt='ll --sort=modified'  # sorted by date (most recent last)
alias lc='lt --changed'        # sorted by date (most recent last) + ctime.
alias lu='lt --accessed'       # sorted by date (most recent last) + atime.
alias lg='la --git'            # long format, + hidden files, + Git status
alias lx='ll --sort=extension' # sorted by extension

# tree
alias tree='ls --tree'

# macOS Everywhere
# todo: chezmoi templates
if [[ "$OSTYPE" == darwin* ]]; then
  alias o='open'
elif [[ "$OSTYPE" == cygwin* ]]; then
  alias o='cygstart'
  alias pbcopy='tee > /dev/clipboard'
  alias pbpaste='cat /dev/clipboard'
elif [[ "$OSTYPE" == linux-android ]]; then
  alias o='termux-open'
  alias pbcopy='termux-clipboard-set'
  alias pbpaste='termux-clipboard-get'
else
  alias o='xdg-open'

  if (( $+commands[xclip] )); then
    alias pbcopy='xclip -selection clipboard -in'
    alias pbpaste='xclip -selection clipboard -out'
  elif (( $+commands[xsel] )); then
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
  fi
fi

alias code=codium
alias lg=lazygit
alias scc='scc --no-cocomo -c --no-min-gen'
