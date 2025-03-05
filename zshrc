# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# =============
# Custom configs
# ============

alias vim=nvim

# Git stuff
alias gpf="git push --force-with-lease"

# Use nvim if in SSH but not in a VSCode terminal
if [ $SSH_CLIENT ] && [ "$TERM_PROGRAM" != "vscode" ]
then
  export EDITOR="nvim"
else
  if command -v cursor 2>&1 >/dev/null
  then
    # Alias code as cursor if we're in cursor
    alias code=cursor
    export EDITOR="cursor --wait"
  else
    export EDITOR="code --wait"
  fi
fi

zstyle ':completion:*:complete:*:_dirs:*' matcher-list ''

chrb() {
  local version="$1"

  case $version in
    3.4)
      version="3.4.2"
      ;;

    3.3)
      version="3.3.6"
      ;;

    3.2)
      version="3.2.4"
      ;;

    3.1)
      version="3.1.5"
      ;;
  esac

  rbenv global $version
}

DOTFILES_DIR=$(dirname -- "$(readlink -f -- ~/.zshrc)")

ruby-git-clean() {
  git clean -fdx
  cp -r $DOTFILES_DIR/vscode/ruby $(git rev-parse --show-toplevel)/.vscode
}

case `uname` in
  Darwin)
    source $DOTFILES_DIR/macos.zshrc
  ;;
  Linux)
    source $DOTFILES_DIR/linux.zshrc
  ;;
esac

LOCAL_ZSHRC_FILE=$DOTFILES_DIR/local.zshrc
if test -f $LOCAL_ZSHRC_FILE; then
  source $LOCAL_ZSHRC_FILE
fi

# Disable dev
if false; then
  [[ -f /opt/dev/sh/chruby/chruby.sh ]] && { type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; } }

  [[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)

  [ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh
fi
