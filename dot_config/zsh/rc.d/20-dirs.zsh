#!/usr/bin/env zsh

#
# Configures directories and shortcuts
#

# Create shortcuts.
hash -d z=$ZDOTDIR
hash -d d=$HOME/dev
hash -d dl=$HOME/Downloads

# Change dirs without `cd`
setopt AUTO_CD