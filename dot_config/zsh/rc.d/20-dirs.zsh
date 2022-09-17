#!/bin/zsh
# Directories and their respective options



# Change dirs without `cd`
setopt AUTO_CD

# Push the old directory onto the stack on cd.
setopt AUTO_PUSHD

# Do not store duplicates in the stack.
setopt PUSHD_IGNORE_DUPS

# Do not print the directory stack after pushd or popd.
setopt PUSHD_SILENT

# Push to home directory when no argument is given.
setopt PUSHD_TO_HOME

# Aliases for quick navigation
alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index



#
# Shortcuts
#

hash -d z=$ZDOTDIR
hash -d c=$HOME/Code
hash -d dl=$HOME/Downloads
(( $+commands[chezmoi] )) && hash -d chezmoi="$(chezmoi source-path)"
hash -d ssh=$HOME/.ssh
