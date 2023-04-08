#!/usr/bin/env zsh

emulate -L zsh -o extended_glob

# Unset all configuration options. This allows you to apply configuration changes without
# restarting zsh. Edit ~/.p10k.zsh and type `source ~/.p10k.zsh`.
unset -m '(POWERLEVEL9K_*|DEFAULT_USER)~POWERLEVEL9K_GITSTATUS_DIR'

# Zsh >= 5.1 is required.
[[ $ZSH_VERSION == (5.<1->*|<6->.*) ]] || return

# The list of segments shown on the left. Fill it with the most important segments.
typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
  # =========================[ Line #1 ]=========================
  context                 # user@hostname
  dir                     # current directory
  direnv
  background_jobs
  vcs                     # git status
  virtualenv
  status
  command_execution_time
  # =========================[ Line #2 ]=========================
  newline                 # \n
  prompt_char             # prompt symbol
)

# The list of segments shown on the right. Fill it with less important segments.
# Right prompt on the last prompt line (where you are typing your commands) gets
# automatically hidden when the input line reaches it. Right prompt above the
# last prompt line gets hidden if it would overlap with left prompt.
typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
# # =========================[ Line #1 ]=========================
  # status                  # exit code of the last command
  # command_execution_time  # duration of the last command
  # background_jobs         # presence of background jobs
  # direnv                  # direnv status (https://direnv.net/)
  # virtualenv              # python virtual environment (https://docs.python.org/3/library/venv.html)
  # pyenv                   # python environment (https://github.com/pyenv/pyenv)
  # nodenv                  # node.js version from nodenv (https://github.com/nodenv/nodenv)
  # package               # name@version from package.json (https://docs.npmjs.com/files/package.json)
  # gcloud                  # google cloud cli account and project (https://cloud.google.com/)
  # google_app_cred         # google application credentials (https://cloud.google.com/docs/authentication/production)
  # nnn                     # nnn shell (https://github.com/jarun/nnn)
  # vim_shell               # vim shell indicator (:sh)
  # # =========================[ Line #2 ]=========================
  # newline                 # \n
# )

# Defines character set used by powerlevel10k. It's best to let `p10k configure` set it for you.
typeset -g POWERLEVEL9K_MODE=nerdfont-complete
# When set to `moderate`, some icons will have an extra space after them. This is meant to avoid
# icon overlap when using non-monospace fonts. When set to `none`, spaces are not added.
typeset -g POWERLEVEL9K_ICON_PADDING=none

# Basic style options that define the overall look of your prompt. You probably don't want to
# change them.
typeset -g POWERLEVEL9K_BACKGROUND=                            # transparent background
typeset -g POWERLEVEL9K_{LEFT,RIGHT}_{LEFT,RIGHT}_WHITESPACE=  # no surrounding whitespace
typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SUBSEGMENT_SEPARATOR=' '  # separate segments with a space
typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SEGMENT_SEPARATOR=        # no end-of-line symbol

# When set to true, icons appear before content on both sides of the prompt. When set
# to false, icons go after content. If empty or not set, icons go before content in the left
# prompt and after content in the right prompt.
#
# You can also override it for a specific segment:
#
#   POWERLEVEL9K_STATUS_ICON_BEFORE_CONTENT=false
#
# Or for a specific segment in specific state:
#
#   POWERLEVEL9K_DIR_NOT_WRITABLE_ICON_BEFORE_CONTENT=false
typeset -g POWERLEVEL9K_ICON_BEFORE_CONTENT=true

# Add an empty line before each prompt.
typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

# Connect left prompt lines with these symbols.
typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=
typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX=
typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=
# Connect right prompt lines with these symbols.
typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_SUFFIX=''
typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_SUFFIX=''
typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_SUFFIX=''

# The left end of left prompt.
typeset -g POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=
# The right end of right prompt.
typeset -g POWERLEVEL9K_RIGHT_PROMPT_LAST_SEGMENT_END_SYMBOL=

# Ruler, a.k.a. the horizontal line before each prompt. If you set it to true, you'll
# probably want to set POWERLEVEL9K_PROMPT_ADD_NEWLINE=false above and
# POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR=' ' below.
typeset -g POWERLEVEL9K_SHOW_RULER=false
typeset -g POWERLEVEL9K_RULER_CHAR='─'        # reasonable alternative: '·'
typeset -g POWERLEVEL9K_RULER_FOREGROUND=7

# Filler between left and right prompt on the first prompt line. You can set it to '·' or '─'
# to make it easier to see the alignment between left and right prompt and to separate prompt
# from command output. It serves the same purpose as ruler (see above) without increasing
# the number of prompt lines. You'll probably want to set POWERLEVEL9K_SHOW_RULER=false
# if using this. You might also like POWERLEVEL9K_PROMPT_ADD_NEWLINE=false for more compact
# prompt.
typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR=' '
if [[ $POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR != ' ' ]]; then
  # The color of the filler.
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_FOREGROUND=7
  # Add a space between the end of left prompt and the filler.
  typeset -g POWERLEVEL9K_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=' '
  # Add a space between the filler and the start of right prompt.
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL=' '
  # Start filler from the edge of the screen if there are no left segments on the first line.
  typeset -g POWERLEVEL9K_EMPTY_LINE_LEFT_PROMPT_FIRST_SEGMENT_END_SYMBOL='%{%}'
  # End filler on the edge of the screen if there are no right segments on the first line.
  typeset -g POWERLEVEL9K_EMPTY_LINE_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL='%{%}'
fi

################################[ prompt_char: prompt symbol ]################################
# Green prompt symbol if the last command succeeded.
typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=2
# Red prompt symbol if the last command failed.
typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=1
# Default prompt symbol.
typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION='$'
# Prompt symbol in command vi mode.
typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_CONTENT_EXPANSION='¢'
# Prompt symbol in visual vi mode.
typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIVIS_CONTENT_EXPANSION='V'
# Prompt symbol in overwrite vi mode.
typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIOWR_CONTENT_EXPANSION='▶'
typeset -g POWERLEVEL9K_PROMPT_CHAR_OVERWRITE_STATE=true
# No line terminator if prompt_char is the last segment.
typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=''
# No line introducer if prompt_char is the first segment.
typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=

##################################[ dir: current directory ]##################################
# Default current directory color.
typeset -g POWERLEVEL9K_DIR_FOREGROUND=4
# If directory is too long, shorten some of its segments to the shortest possible unique
# prefix. The shortened directory can be tab-completed to the original.
typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_unique
# Replace removed segment suffixes with this symbol.
typeset -g POWERLEVEL9K_SHORTEN_DELIMITER=
# Color of the shortened directory segments.
typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=4
# Color of the anchor directory segments. Anchor segments are never shortened. The first
# segment is always an anchor.
typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=4
# Set to true to display anchor directory segments in bold.
typeset -g POWERLEVEL9K_DIR_ANCHOR_BOLD=false
# Don't shorten directories that contain any of these files. They are anchors.
local anchor_files=(
  .bzr
  .citc
  .git
  .hg
  .node-version
  .python-version
  .go-version
  .ruby-version
  .lua-version
  .java-version
  .perl-version
  .php-version
  .tool-version
  .shorten_folder_marker
  .svn
  .terraform
  CVS
  Cargo.toml
  composer.json
  go.mod
  package.json
  pyproject.toml
  stack.yaml
)
typeset -g POWERLEVEL9K_SHORTEN_FOLDER_MARKER="(${(j:|:)anchor_files})"
# If set to "first" ("last"), remove everything before the first (last) subdirectory that contains
# files matching $POWERLEVEL9K_SHORTEN_FOLDER_MARKER. For example, when the current directory is
# /foo/bar/git_repo/nested_git_repo/baz, prompt will display git_repo/nested_git_repo/baz (first)
# or nested_git_repo/baz (last). This assumes that git_repo and nested_git_repo contain markers
# and other directories don't.
#
# Optionally, "first" and "last" can be followed by ":<offset>" where <offset> is an integer.
# This moves the truncation point to the right (positive offset) or to the left (negative offset)
# relative to the marker. Plain "first" and "last" are equivalent to "first:0" and "last:0"
# respectively.
typeset -g POWERLEVEL9K_DIR_TRUNCATE_BEFORE_MARKER=false
# Don't shorten this many last directory segments. They are anchors.
typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
# Do not shorten directory unless necessary
typeset -g POWERLEVEL9K_DIR_MAX_LENGTH=

# If set to true, embed a hyperlink into the directory. Useful for quickly
# opening a directory in the file manager simply by clicking the link.
# Can also be handy when the directory is shortened, as it allows you to see
# the full directory that was used in previous commands.
typeset -g POWERLEVEL9K_DIR_HYPERLINK=true

# Enable special styling for non-writable directories. See POWERLEVEL9K_LOCK_ICON and
# POWERLEVEL9K_DIR_CLASSES below.
typeset -g POWERLEVEL9K_DIR_SHOW_WRITABLE=v2

# Enable special styling for non-writable and non-existent directories. See POWERLEVEL9K_LOCK_ICON
# and POWERLEVEL9K_DIR_CLASSES below.
typeset -g POWERLEVEL9K_DIR_SHOW_WRITABLE=v3

typeset -g POWERLEVEL9K_DIR_CLASSES=()

#####################################[ vcs: git status ]######################################
# Branch icon. Set this parameter to '\UE0A0 ' for the popular Powerline branch icon.
typeset -g POWERLEVEL9K_VCS_BRANCH_ICON=

# Untracked files icon. It's really a question mark, your font isn't broken.
# Change the value of this parameter to show a different icon.
typeset -g POWERLEVEL9K_VCS_UNTRACKED_ICON='?'

# Formatter for Git status.
#
# Example output: master wip ⇣42⇡42 *42 merge ~42 +42 !42 ?42.
#
# You can edit the function to customize how Git status looks.
#
# VCS_STATUS_* parameters are set by gitstatus plugin. See reference:
# https://github.com/romkatv/gitstatus/blob/master/gitstatus.plugin.zsh.
function my_git_formatter() {
  emulate -L zsh

  if [[ -n $P9K_CONTENT ]]; then
    # If P9K_CONTENT is not empty, use it. It's either "loading" or from vcs_info (not from
    # gitstatus plugin). VCS_STATUS_* parameters are not available in this case.
    typeset -g my_git_format=$P9K_CONTENT
    return
  fi

  if (( $1 )); then
    # Styling for up-to-date Git status.
    local       meta='%f'   # default foreground
    local      clean='%2F'  # green foreground
    local   modified='%3F'  # yellow foreground
    local  untracked='%4F'  # blue foreground
    local conflicted='%1F'  # red foreground
  else
    # Styling for incomplete and stale Git status.
    local       meta='%f'  # default foreground
    local      clean='%f'  # default foreground
    local   modified='%f'  # default foreground
    local  untracked='%f'  # default foreground
    local conflicted='%f'  # default foreground
  fi

  local res

  if [[ -n $VCS_STATUS_LOCAL_BRANCH ]]; then
    local branch=${(V)VCS_STATUS_LOCAL_BRANCH}
    # If local branch name is at most 32 characters long, show it in full.
    # Otherwise show the first 12 … the last 12.
    # Tip: To always show local branch name in full without truncation, delete the next line.
    (( $#branch > 32 )) && branch[13,-13]="…"  # <-- this line
    res+="${clean}${(g::)POWERLEVEL9K_VCS_BRANCH_ICON}${branch//\%/%%}"
  fi

  if [[ -n $VCS_STATUS_TAG
        # Show tag only if not on a branch.
        # Tip: To always show tag, delete the next line.
        && -z $VCS_STATUS_LOCAL_BRANCH  # <-- this line
      ]]; then
    local tag=${(V)VCS_STATUS_TAG}
    # If tag name is at most 32 characters long, show it in full.
    # Otherwise show the first 12 … the last 12.
    # Tip: To always show tag name in full without truncation, delete the next line.
    (( $#tag > 32 )) && tag[13,-13]="…"  # <-- this line
    res+="${meta}#${clean}${tag//\%/%%}"
  fi

  # Display the current Git commit if there is no branch and no tag.
  # Tip: To always display the current Git commit, delete the next line.
  [[ -z $VCS_STATUS_LOCAL_BRANCH && -z $VCS_STATUS_TAG ]] &&  # <-- this line
    res+="${meta}@${clean}${VCS_STATUS_COMMIT[1,8]}"

  # Show tracking branch name if it differs from local branch.
  if [[ -n ${VCS_STATUS_REMOTE_BRANCH:#$VCS_STATUS_LOCAL_BRANCH} ]]; then
    res+="${meta}:${clean}${(V)VCS_STATUS_REMOTE_BRANCH//\%/%%}"
  fi

  # Display "wip" if the latest commit's summary contains "wip" or "WIP".
  if [[ $VCS_STATUS_COMMIT_SUMMARY == (|*[^[:alnum:]])(wip|WIP)(|[^[:alnum:]]*) ]]; then
    res+=" ${modified}wip"
  fi

  # ⇣42 if behind the remote.
  (( VCS_STATUS_COMMITS_BEHIND )) && res+=" ${clean}⇣${VCS_STATUS_COMMITS_BEHIND}"
  # ⇡42 if ahead of the remote; no leading space if also behind the remote: ⇣42⇡42.
  (( VCS_STATUS_COMMITS_AHEAD && !VCS_STATUS_COMMITS_BEHIND )) && res+=" "
  (( VCS_STATUS_COMMITS_AHEAD  )) && res+="${clean}⇡${VCS_STATUS_COMMITS_AHEAD}"
  # ⇠42 if behind the push remote.
  (( VCS_STATUS_PUSH_COMMITS_BEHIND )) && res+=" ${clean}⇠${VCS_STATUS_PUSH_COMMITS_BEHIND}"
  (( VCS_STATUS_PUSH_COMMITS_AHEAD && !VCS_STATUS_PUSH_COMMITS_BEHIND )) && res+=" "
  # ⇢42 if ahead of the push remote; no leading space if also behind: ⇠42⇢42.
  (( VCS_STATUS_PUSH_COMMITS_AHEAD  )) && res+="${clean}⇢${VCS_STATUS_PUSH_COMMITS_AHEAD}"
  # *42 if have stashes.
  (( VCS_STATUS_STASHES        )) && res+=" ${clean}*${VCS_STATUS_STASHES}"
  # 'merge' if the repo is in an unusual state.
  [[ -n $VCS_STATUS_ACTION     ]] && res+=" ${conflicted}${VCS_STATUS_ACTION}"
  # ~42 if have merge conflicts.
  (( VCS_STATUS_NUM_CONFLICTED )) && res+=" ${conflicted}~${VCS_STATUS_NUM_CONFLICTED}"
  # +42 if have staged changes.
  (( VCS_STATUS_NUM_STAGED     )) && res+=" ${modified}+${VCS_STATUS_NUM_STAGED}"
  # !42 if have unstaged changes.
  (( VCS_STATUS_NUM_UNSTAGED   )) && res+=" ${modified}!${VCS_STATUS_NUM_UNSTAGED}"
  # ?42 if have untracked files. It's really a question mark, your font isn't broken.
  # See POWERLEVEL9K_VCS_UNTRACKED_ICON above if you want to use a different icon.
  # Remove the next line if you don't want to see untracked files at all.
  (( VCS_STATUS_NUM_UNTRACKED  )) && res+=" ${untracked}${(g::)POWERLEVEL9K_VCS_UNTRACKED_ICON}${VCS_STATUS_NUM_UNTRACKED}"
  # "─" if the number of unstaged files is unknown. This can happen due to
  # POWERLEVEL9K_VCS_MAX_INDEX_SIZE_DIRTY (see below) being set to a non-negative number lower
  # than the number of files in the Git index, or due to bash.showDirtyState being set to false
  # in the repository config. The number of staged and untracked files may also be unknown
  # in this case.
  (( VCS_STATUS_HAS_UNSTAGED == -1 )) && res+=" ${modified}─"

  typeset -g my_git_format=$res
}
functions -M my_git_formatter 2>/dev/null

# Don't count the number of unstaged, untracked and conflicted files in Git repositories with
# more than this many files in the index. Negative value means infinity.
#
# If you are working in Git repositories with tens of millions of files and seeing performance
# sagging, try setting POWERLEVEL9K_VCS_MAX_INDEX_SIZE_DIRTY to a number lower than the output
# of `git ls-files | wc -l`. Alternatively, add `bash.showDirtyState = false` to the repository's
# config: `git config bash.showDirtyState false`.
typeset -g POWERLEVEL9K_VCS_MAX_INDEX_SIZE_DIRTY=-1

# Don't show Git status in prompt for repositories whose workdir matches this pattern.
# For example, if set to '~', the Git repository at $HOME/.git will be ignored.
# Multiple patterns can be combined with '|': '~(|/foo)|/bar/baz/*'.
typeset -g POWERLEVEL9K_VCS_DISABLED_WORKDIR_PATTERN='~'

# Disable the default Git status formatting.
typeset -g POWERLEVEL9K_VCS_DISABLE_GITSTATUS_FORMATTING=true
# Install our own Git status formatter.
typeset -g POWERLEVEL9K_VCS_CONTENT_EXPANSION='${$((my_git_formatter(1)))+${my_git_format}}'
typeset -g POWERLEVEL9K_VCS_LOADING_CONTENT_EXPANSION='${$((my_git_formatter(0)))+${my_git_format}}'
# Enable counters for staged, unstaged, etc.
typeset -g POWERLEVEL9K_VCS_{STAGED,UNSTAGED,UNTRACKED,CONFLICTED,COMMITS_AHEAD,COMMITS_BEHIND}_MAX_NUM=-1

# Icon color.
typeset -g POWERLEVEL9K_VCS_VISUAL_IDENTIFIER_COLOR=2
typeset -g POWERLEVEL9K_VCS_LOADING_VISUAL_IDENTIFIER_COLOR=
# Custom icon.
typeset -g POWERLEVEL9K_VCS_VISUAL_IDENTIFIER_EXPANSION=

# Show status of repositories of these types. You can add svn and/or hg if you are
# using them. If you do, your prompt may become slow even when your current directory
# isn't in an svn or hg repository.
typeset -g POWERLEVEL9K_VCS_BACKENDS=(git)

# These settings are used for repositories other than Git or when gitstatusd fails and
# Powerlevel10k has to fall back to using vcs_info.
typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=2
typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=2
typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=3

##########################[ status: exit code of the last command ]###########################
# Enable OK_PIPE, ERROR_PIPE and ERROR_SIGNAL status states to allow us to enable, disable and
# style them independently from the regular OK and ERROR state.
typeset -g POWERLEVEL9K_STATUS_EXTENDED_STATES=true

# Status on success. No content, just an icon. No need to show it if prompt_char is enabled as
# it will signify success by turning green.
typeset -g POWERLEVEL9K_STATUS_OK=false
typeset -g POWERLEVEL9K_STATUS_OK_FOREGROUND=2
typeset -g POWERLEVEL9K_STATUS_OK_VISUAL_IDENTIFIER_EXPANSION='✔'

# Status when some part of a pipe command fails but the overall exit status is zero. It may look
# like this: 1|0.
typeset -g POWERLEVEL9K_STATUS_OK_PIPE=true
typeset -g POWERLEVEL9K_STATUS_OK_PIPE_FOREGROUND=2
typeset -g POWERLEVEL9K_STATUS_OK_PIPE_VISUAL_IDENTIFIER_EXPANSION='✔'

# Status when it's just an error code (e.g., '1'). No need to show it if prompt_char is enabled as
# it will signify error by turning red.
typeset -g POWERLEVEL9K_STATUS_ERROR=false
typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=1
typeset -g POWERLEVEL9K_STATUS_ERROR_VISUAL_IDENTIFIER_EXPANSION='✘'

# Status when the last command was terminated by a signal.
typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL=true
typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_FOREGROUND=1
# Use terse signal names: "INT" instead of "SIGINT(2)".
typeset -g POWERLEVEL9K_STATUS_VERBOSE_SIGNAME=false
typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_VISUAL_IDENTIFIER_EXPANSION='✘'

# Status when some part of a pipe command fails and the overall exit status is also non-zero.
# It may look like this: 1|0.
typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE=true
typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_FOREGROUND=1
typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_VISUAL_IDENTIFIER_EXPANSION='✘'

###################[ command_execution_time: duration of the last command ]###################
# Show duration of the last command if takes at least this many seconds.
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=3
# Show this many fractional digits. Zero means round to seconds.
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=0
# Execution time color.
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=3
# Duration format: 1d 2h 3m 4s.
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FORMAT='d h m s'
# Custom icon.
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_VISUAL_IDENTIFIER_EXPANSION=

#######################[ background_jobs: presence of background jobs ]#######################
# Don't show the number of background jobs.
typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE=true
# Background jobs color.
typeset -g POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND=1

#######################[ direnv: direnv status (https://direnv.net/) ]########################
# Direnv color.
typeset -g POWERLEVEL9K_DIRENV_FOREGROUND=3

######################[ nnn: nnn shell (https://github.com/jarun/nnn) ]#######################
# Nnn shell color.
typeset -g POWERLEVEL9K_NNN_FOREGROUND=3

###########################[ vim_shell: vim shell indicator (:sh) ]###########################
# Vim shell indicator color.
typeset -g POWERLEVEL9K_VIM_SHELL_FOREGROUND=3

##################################[ context: user@hostname ]##################################
# Context color when running with privileges.
typeset -g POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND=1
# Context color in SSH without privileges.
typeset -g POWERLEVEL9K_CONTEXT_{REMOTE,REMOTE_SUDO}_FOREGROUND=7
# Default context color (no privileges, no SSH).
typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND=7

# Context format when running with privileges: bold user@hostname.
typeset -g POWERLEVEL9K_CONTEXT_ROOT_TEMPLATE='%B%n@%m'
# Context format when in SSH without privileges: user@hostname.
typeset -g POWERLEVEL9K_CONTEXT_{REMOTE,REMOTE_SUDO}_TEMPLATE='%n@%m'
# Default context format (no privileges, no SSH): user@hostname.
typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='%n@%m'

# Don't show context unless running with privileges or in SSH.
typeset -g POWERLEVEL9K_CONTEXT_{DEFAULT,SUDO}_{CONTENT,VISUAL_IDENTIFIER}_EXPANSION=

###[ virtualenv: python virtual environment (https://docs.python.org/3/library/venv.html) ]###
# Python virtual environment color.
typeset -g POWERLEVEL9K_VIRTUALENV_FOREGROUND=6
# Don't show Python version next to the virtual environment name.
typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_PYTHON_VERSION=false
# If set to "false", won't show virtualenv if pyenv is already shown.
# If set to "if-different", won't show virtualenv if it's the same as pyenv.
typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_WITH_PYENV=false
# Separate environment name from Python version only with a space.
typeset -g POWERLEVEL9K_VIRTUALENV_{LEFT,RIGHT}_DELIMITER=

################[ pyenv: python environment (https://github.com/pyenv/pyenv) ]################
# Pyenv color.
typeset -g POWERLEVEL9K_PYENV_FOREGROUND=6
# Hide python version if it doesn't come from one of these sources.
typeset -g POWERLEVEL9K_PYENV_SOURCES=(shell local global)
# If set to false, hide python version if it's the same as global:
# $(pyenv version-name) == $(pyenv global).
typeset -g POWERLEVEL9K_PYENV_PROMPT_ALWAYS_SHOW=false
# If set to false, hide python version if it's equal to "system".
typeset -g POWERLEVEL9K_PYENV_SHOW_SYSTEM=true

# Pyenv segment format. The following parameters are available within the expansion.
#
# - P9K_CONTENT                Current pyenv environment (pyenv version-name).
# - P9K_PYENV_PYTHON_VERSION   Current python version (python --version).
#
# The default format has the following logic:
#
# 1. Display just "$P9K_CONTENT" if it's equal to "$P9K_PYENV_PYTHON_VERSION" or
#    starts with "$P9K_PYENV_PYTHON_VERSION/".
# 2. Otherwise display "$P9K_CONTENT $P9K_PYENV_PYTHON_VERSION".
typeset -g POWERLEVEL9K_PYENV_CONTENT_EXPANSION='${P9K_CONTENT}${${P9K_CONTENT:#$P9K_PYENV_PYTHON_VERSION(|/*)}:+ $P9K_PYENV_PYTHON_VERSION}'

##########[ nodenv: node.js version from nodenv (https://github.com/nodenv/nodenv) ]##########
# Nodenv color.
typeset -g POWERLEVEL9K_NODENV_FOREGROUND=2
# Hide node version if it doesn't come from one of these sources.
typeset -g POWERLEVEL9K_NODENV_SOURCES=(shell local global)
# If set to false, hide node version if it's the same as global:
# $(nodenv version-name) == $(nodenv global).
typeset -g POWERLEVEL9K_NODENV_PROMPT_ALWAYS_SHOW=false
# If set to false, hide node version if it's equal to "system".
typeset -g POWERLEVEL9K_NODENV_SHOW_SYSTEM=true

####################[ java_version: java version (https://www.java.com/) ]####################
# Java version color.
typeset -g POWERLEVEL9K_JAVA_VERSION_FOREGROUND=4
# Show java version only when in a java project subdirectory.
typeset -g POWERLEVEL9K_JAVA_VERSION_PROJECT_ONLY=true
# Show brief version.
typeset -g POWERLEVEL9K_JAVA_VERSION_FULL=false

###[ package: name@version from package.json (https://docs.npmjs.com/files/package.json) ]####
# Package color.
typeset -g POWERLEVEL9K_PACKAGE_FOREGROUND=6

##########[ gcloud: google cloud account and project (https://cloud.google.com/) ]###########
# Show gcloud only when the command you are typing invokes one of these tools.
typeset -g POWERLEVEL9K_GCLOUD_SHOW_ON_COMMAND='gcloud|gcs|gsutil'
# Google cloud color.
typeset -g POWERLEVEL9K_GCLOUD_FOREGROUND=4

# Google cloud format. Change the value of POWERLEVEL9K_GCLOUD_PARTIAL_CONTENT_EXPANSION and/or
# POWERLEVEL9K_GCLOUD_COMPLETE_CONTENT_EXPANSION if the default is too verbose or not informative
# enough. You can use the following parameters in the expansions. Each of them corresponds to the
# output of `gcloud` tool.
#
#   Parameter                | Source
#   -------------------------|--------------------------------------------------------------------
#   P9K_GCLOUD_CONFIGURATION | gcloud config configurations list --format='value(name)'
#   P9K_GCLOUD_ACCOUNT       | gcloud config get-value account
#   P9K_GCLOUD_PROJECT_ID    | gcloud config get-value project
#   P9K_GCLOUD_PROJECT_NAME  | gcloud projects describe $P9K_GCLOUD_PROJECT_ID --format='value(name)'
#
# Note: ${VARIABLE//\%/%%} expands to ${VARIABLE} with all occurrences of '%' replaced with '%%'.
#
# Obtaining project name requires sending a request to Google servers. This can take a long time
# and even fail. When project name is unknown, P9K_GCLOUD_PROJECT_NAME is not set and gcloud
# prompt segment is in state PARTIAL. When project name gets known, P9K_GCLOUD_PROJECT_NAME gets
# set and gcloud prompt segment transitions to state COMPLETE.
#
# You can customize the format, icon and colors of gcloud segment separately for states PARTIAL
# and COMPLETE. You can also hide gcloud in state PARTIAL by setting
# POWERLEVEL9K_GCLOUD_PARTIAL_VISUAL_IDENTIFIER_EXPANSION and
# POWERLEVEL9K_GCLOUD_PARTIAL_CONTENT_EXPANSION to empty.
typeset -g POWERLEVEL9K_GCLOUD_PARTIAL_CONTENT_EXPANSION='${P9K_GCLOUD_PROJECT_ID//\%/%%}'
typeset -g POWERLEVEL9K_GCLOUD_COMPLETE_CONTENT_EXPANSION='${P9K_GCLOUD_PROJECT_NAME//\%/%%}'

# Send a request to Google (by means of `gcloud projects describe ...`) to obtain project name
# this often. Negative value disables periodic polling. In this mode project name is retrieved
# only when the current configuration, account or project id changes.
typeset -g POWERLEVEL9K_GCLOUD_REFRESH_PROJECT_NAME_SECONDS=60

#[ google_app_cred: google application credentials (https://cloud.google.com/docs/authentication/production) ]#
# Show google_app_cred only when the command you are typing invokes one of these tools.
# Tip: Remove the next line to always show google_app_cred.
typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_SHOW_ON_COMMAND='terraform|pulumi|terragrunt'

# Google application credentials classes for the purpose of using different colors, icons and
# expansions with different credentials.
#
# POWERLEVEL9K_GOOGLE_APP_CRED_CLASSES is an array with even number of elements. The first
# element in each pair defines a pattern against which the current kubernetes context gets
# matched. More specifically, it's P9K_CONTENT prior to the application of context expansion
# (see below) that gets matched. If you unset all POWERLEVEL9K_GOOGLE_APP_CRED_*CONTENT_EXPANSION
# parameters, you'll see this value in your prompt. The second element of each pair in
# POWERLEVEL9K_GOOGLE_APP_CRED_CLASSES defines the context class. Patterns are tried in order.
# The first match wins.
#
# For example, given these settings:
#
#   typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_CLASSES=(
#     '*:*prod*:*'  PROD
#     '*:*test*:*'  TEST
#     '*'           DEFAULT)
#
# If your current Google application credentials is "service_account deathray-testing x@y.com",
# its class is TEST because it doesn't match the pattern '* *prod* *' but does match '* *test* *'.
#
# You can define different colors, icons and content expansions for different classes:
#
#   typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_TEST_FOREGROUND=3
#   typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_TEST_VISUAL_IDENTIFIER_EXPANSION='⭐'
#   typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_TEST_CONTENT_EXPANSION='$P9K_GOOGLE_APP_CRED_PROJECT_ID'
typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_CLASSES=(
    # '*:*prod*:*'  PROD    # These values are examples that are unlikely
    # '*:*test*:*'  TEST    # to match your needs. Customize them as needed.
    '*'             DEFAULT)
typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_DEFAULT_FOREGROUND=5
# typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_DEFAULT_VISUAL_IDENTIFIER_EXPANSION='⭐'

# Use POWERLEVEL9K_GOOGLE_APP_CRED_CONTENT_EXPANSION to specify the content displayed by
# google_app_cred segment. Parameter expansions are very flexible and fast, too. See reference:
# http://zsh.sourceforge.net/Doc/Release/Expansion.html#Parameter-Expansion.
#
# You can use the following parameters in the expansion. Each of them corresponds to one of the
# fields in the JSON file pointed to by GOOGLE_APPLICATION_CREDENTIALS.
#
#   Parameter                        | JSON key file field
#   ---------------------------------+---------------
#   P9K_GOOGLE_APP_CRED_TYPE         | type
#   P9K_GOOGLE_APP_CRED_PROJECT_ID   | project_id
#   P9K_GOOGLE_APP_CRED_CLIENT_EMAIL | client_email
#
# Note: ${VARIABLE//\%/%%} expands to ${VARIABLE} with all occurrences of '%' replaced by '%%'.
typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_DEFAULT_CONTENT_EXPANSION='${P9K_GOOGLE_APP_CRED_PROJECT_ID//\%/%%}'

# Don't change prompt when accepting a command line.
typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=off

# Instant prompt mode.
#   - quiet:   Enable instant prompt and don't print warnings when detecting console output
#              during zsh initialization. Choose this if you've read and understood
#              https://github.com/romkatv/powerlevel10k/blob/master/README.md#instant-prompt.
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Hot reload allows you to change POWERLEVEL9K options after Powerlevel10k has been initialized.
# For example, you can type POWERLEVEL9K_BACKGROUND=red and see your prompt turn red. Hot reload
# can slow down prompt by 1-2 milliseconds, so it's better to keep it turned off unless you
# really need it.
typeset -g POWERLEVEL9K_DISABLE_HOT_RELOAD=true

# If p10k is already loaded, reload configuration.
# This works even with POWERLEVEL9K_DISABLE_HOT_RELOAD=true.
(( ! $+functions[p10k] )) || p10k reload
