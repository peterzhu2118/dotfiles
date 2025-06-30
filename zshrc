DOTFILES_DIR=$(dirname -- "$(readlink -f -- ~/.zshrc)")

source $DOTFILES_DIR/common.zshrc

if test -n "$USE_SHOPIFY_SHELL"; then
  source $DOTFILES_DIR/shopify.zshrc
else
  source $DOTFILES_DIR/default.zshrc
fi

switch_shopify_shell() {
  export USE_SHOPIFY_SHELL=1
  exec zsh
}

switch_default_shell() {
  unset USE_SHOPIFY_SHELL
  exec zsh
}
