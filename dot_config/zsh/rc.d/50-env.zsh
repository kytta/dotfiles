#!/usr/env/bin zsh

#
# Defines environment variables
#

# -U ensures each entry in these is Unique
export -U PATH path FPATH fpath MANPATH manpath
export -UT INFOPATH infopath  # -T creates a "tied" pair

path=(
  /usr/local/opt/gnu-getopt/bin
  /usr/local/opt/mysql-client/bin
  /usr/local/opt/ncurses/bin

  $path
  ~/.local/bin
  $HOME/.cargo/bin
  # /usr/local/opt/node@16/bin
)

fpath=(
  $ZDOTDIR/functions
  $fpath
  ~/.local/share/zsh/site-functions
)

# Add Homebrew envvars and add custom completions to fpath
if command -v brew > /dev/null; then
  eval "$(brew shellenv)"
  fpath+=( $HOMEBREW_PREFIX/share/zsh/site-functions )
fi

# Set the Android SDK path
export ANDROID_HOME="$XDG_DATA_HOME/Android/sdk"

# Set PATH and completions for the Google Cloud SDK.
if [ -f '$HOME/google-cloud-sdk/path.zsh.inc' ]; then . '$HOME/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '$HOME/google-cloud-sdk/completion.zsh.inc' ]; then . '$HOME/google-cloud-sdk/completion.zsh.inc'; fi


# Editors
export EDITOR=nano
export VISUAL=nano
export PAGER=less
export LESS='--ignore-case --LONG-PROMPT --RAW-CONTROL-CHARS --chop-long-lines --hilite-unread --tabs=4'

# macOS stuff
if [[ "$OSTYPE" == darwin* ]]; then
  # set browser to `open`
  export BROWSER=open

  # fix python multiprocessing
  export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES 
fi
