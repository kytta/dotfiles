#!/usr/bin/env zsh

#
# Aliases and commands
#

# These aliases enable us to paste example code into the terminal without the
# shell complaining about the pasted prompt symbol.
alias %= \$=

# zmv lets you batch rename (or copy or link) files by using pattern matching.
# https://zsh.sourceforge.io/Doc/Release/User-Contributions.html#index-zmv
autoload -Uz zmv
alias zmv='zmv -Mv'
alias zcp='zmv -Cv'
alias zln='zmv -Lv'

# Associate file .extensions with programs.
alias -s gz='gzip -l'
alias -s {log,out}='tail -F'

# Use `< file` to quickly view the contents of any file.
READNULLCMD=$PAGER  # Set the program to use for this.

# load commands
autoload -Uz \
  archive \
  cdtmp \
  docker-prune-all \
  gi \
  gpg-export-key \
  vpn \
  wttr

alias code=codium
alias scc='scc --no-cocomo -c --no-min-gen'
