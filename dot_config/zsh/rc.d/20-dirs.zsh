#!/usr/bin/env zsh

# Change dirs without `cd`
setopt AUTO_CD

# Create shortcuts.
hash -d z=$ZDOTDIR
hash -d de=$HOME/Development
hash -d dew=$HOME/Development/Work
hash -d dep=$HOME/Development/Personal
hash -d dee=$HOME/Development/Education
hash -d dl=$HOME/Downloads
hash -d chezmoi="$(chezmoi source-path)"
