#!/usr/bin/env zsh

# Change dirs without `cd`
setopt AUTO_CD

# Create shortcuts.
hash -d z=$ZDOTDIR
hash -d c=$HOME/Code
hash -d dl=$HOME/Downloads
(( $+commands[chezmoi] )) && hash -d chezmoi="$(chezmoi source-path)"
hash -d ssh=$HOME/.ssh
