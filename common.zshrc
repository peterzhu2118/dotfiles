export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

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
