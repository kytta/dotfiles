#!/usr/bin/env zsh

# Don't let > overwrite files. To overwrite, use >| instead.
setopt NO_CLOBBER

# Allow comments to be pasted into the command line.
setopt INTERACTIVE_COMMENTS

# Don't treat non-executable files in your $path as commands.
setopt HASH_EXECUTABLES_ONLY



#
# GLOBBING
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
# JOBS
#

# List jobs in the long format by default.
setopt LONG_LIST_JOBS

# Report status of background jobs immediately.
setopt NOTIFY

# Don't run all background jobs at a lower priority.
unsetopt BG_NICE

# Don't kill jobs on shell exit.
unsetopt HUP

# Don't report on jobs when shell exit.
unsetopt CHECK_JOBS
