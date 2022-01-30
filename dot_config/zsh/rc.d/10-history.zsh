#!/usr/bin/env zsh

#
# Configures Zsh history
#

# Where to store history
HISTFILE=${XDG_DATA_HOME:=~/.local/share}/zsh/history

# Create history directory if it doesn't exist
# TODO: use chezmoi scripts
[[ -d $HISTFILE:h ]] || mkdir -p $HISTFILE:h

# Max number of entries to keep in history file.
SAVEHIST=$(( 100 * 1000 ))      # one hundred thousand

# Max number of history entries to keep in memory.
HISTSIZE=$(( 1.2 * SAVEHIST ))  # Zsh recommended value

# Use modern file-locking mechanisms, for better safety & performance.
setopt HIST_FCNTL_LOCK

# Keep only the most recent copy of each duplicate entry in history.
setopt HIST_IGNORE_ALL_DUPS

# Auto-sync history between concurrent sessions.
setopt SHARE_HISTORY
