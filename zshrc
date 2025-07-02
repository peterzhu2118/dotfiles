DOTFILES_DIR=$(dirname -- "$(readlink -f -- ~/.zshrc)")

source $DOTFILES_DIR/common.zshrc

if [[ "$USE_SHOPIFY_SHELL" == "1" || "$USE_SHOPIFY_SHELL" == "force" ]]; then
  source $DOTFILES_DIR/shopify.zshrc
else
  source $DOTFILES_DIR/default.zshrc
fi

switch_shopify_shell() {
  export USE_SHOPIFY_SHELL=force
  exec zsh
}

switch_default_shell() {
  export USE_SHOPIFY_SHELL=0
  exec zsh
}

auto_switch_shell_on_cd() {
  if [[ "$PWD" == "$HOME/world"* ]]; then
    if [[ -z "$USE_SHOPIFY_SHELL" ]]; then
      export USE_SHOPIFY_SHELL=1
      exec zsh
    fi
  else
    if [[ "$USE_SHOPIFY_SHELL" == "1" ]]; then
      unset USE_SHOPIFY_SHELL
      exec zsh
    fi
  fi
}
auto_switch_shell_on_cd

autoload -U add-zsh-hook
add-zsh-hook chpwd auto_switch_shell_on_cd
