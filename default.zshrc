plugins=(git)

zstyle ':completion:*:complete:*:_dirs:*' matcher-list ''

eval "$(~/.rbenv/bin/rbenv init - zsh)"

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
