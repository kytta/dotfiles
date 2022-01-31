#!/usr/bin/env zsh

# Change dirs without `cd`
setopt AUTO_CD

# Create shortcuts.
hash -d z=$ZDOTDIR
hash -d d=$HOME/dev
hash -d dl=$HOME/Downloads
hash -d chezmoi="$(chezmoi source-path)"