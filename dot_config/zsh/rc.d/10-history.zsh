#!/usr/bin/env zsh

# Write the history file in the ':start:elapsed;command' format.
setopt EXTENDED_HISTORY

# Where to store history
HISTFILE=${XDG_DATA_HOME:=~/.local/share}/zsh/history
# Create history directory if it doesn't exist
# TODO: use chezmoi scripts
[[ -d $HISTFILE:h ]] || mkdir -p $HISTFILE:h

# Max number of entries to keep in history file and in memory
SAVEHIST=$(( 100 * 1000 ))      # one hundred thousand
HISTSIZE=$(( 1.2 * SAVEHIST ))  # Zsh recommended value

# Use modern file-locking mechanisms, for better safety & performance.
setopt HIST_FCNTL_LOCK

# Do not write a duplicate event to the history file.
setopt HIST_SAVE_NO_DUPS

# Keep only the most recent copy of each duplicate entry in history.
setopt HIST_IGNORE_ALL_DUPS

# Auto-sync history between concurrent sessions.
setopt SHARE_HISTORY

# Do not record an event starting with a space.
setopt HIST_IGNORE_SPACE
