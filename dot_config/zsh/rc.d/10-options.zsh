#!/bin/zsh
# Z Shell options



#
# General
#

# Combine zero-length punctuation characters (accents) with the base character.
setopt COMBINING_CHARS

# Don't treat non-executable files in your $path as commands.
setopt HASH_EXECUTABLES_ONLY

# Allow comments to be pasted into the command line.
setopt INTERACTIVE_COMMENTS

# Don't print a warning message if a mail file has been accessed.
unsetopt MAIL_WARNING

# Don't let > overwrite files. To overwrite, use >| instead.
setopt NO_CLOBBER



#
# Globbing
#

# Enable additional glob operators. (Globbing = pattern matching)
# https://zsh.sourceforge.io/Doc/Release/Expansion.html#Filename-Generation
setopt EXTENDED_GLOB

# Enable ** and *** as shortcuts for **/* and ***, respectively.
# https://zsh.sourceforge.io/Doc/Release/Expansion.html#Recursive-Globbing
setopt GLOB_STAR_SHORT

# Sort numbers numerically, not lexicographically.
setopt NUMERIC_GLOB_SORT

# Disable globbing.
alias find='noglob find'
alias fd='noglob fd'
alias ftp='noglob ftp'
alias history='noglob history'
alias locate='noglob locate'
alias rake='noglob rake'
alias rsync='noglob rsync'
alias scp='noglob scp'
alias sftp='noglob sftp'



#
# Jobs
#

# Don't run all background jobs at a lower priority.
unsetopt BG_NICE

# Don't report on jobs when shell exit.
unsetopt CHECK_JOBS

# Don't kill jobs on shell exit.
unsetopt HUP

# List jobs in the long format by default.
setopt LONG_LIST_JOBS

# Report status of background jobs immediately.
setopt NOTIFY



#
# History
#

# Where to store history
HISTFILE=${XDG_DATA_HOME}/zsh/history

# Create history directory if it doesn't exist
# TODO: use chezmoi scripts
[[ -d $HISTFILE:h ]] || mkdir -p $HISTFILE:h

# Max number of entries to keep in history file and in memory
SAVEHIST=$(( 100 * 1000 ))      # one hundred thousand
HISTSIZE=$(( 1.2 * SAVEHIST ))  # Zsh recommended value

# Write the history file in the ':start:elapsed;command' format.
setopt EXTENDED_HISTORY

# Use modern file-locking mechanisms, for better safety & performance.
setopt HIST_FCNTL_LOCK

# Keep only the most recent copy of each duplicate entry in history.
setopt HIST_IGNORE_ALL_DUPS

# Do not record an event starting with a space.
setopt HIST_IGNORE_SPACE

# Do not write a duplicate event to the history file.
setopt HIST_SAVE_NO_DUPS

# Auto-sync history between concurrent sessions.
setopt SHARE_HISTORY



#
# Smart URLs
# Source: https://github.com/sorin-ionescu/prezto/blob/51c4ff6de4e2d1afd30e52ba19b21b1128fd1ed5/modules/environment/init.zsh#L16-L27
#

autoload -Uz is-at-least
if [[ ${ZSH_VERSION} != 5.1.1 && ${TERM} != "dumb" ]]; then
  if is-at-least 5.2; then
    autoload -Uz bracketed-paste-url-magic
    zle -N bracketed-paste bracketed-paste-url-magic
  elif is-at-least 5.1; then
    autoload -Uz bracketed-paste-magic
    zle -N bracketed-paste bracketed-paste-magic
  fi
  autoload -Uz url-quote-magic
  zle -N self-insert url-quote-magic
fi
