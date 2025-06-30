zstyle ':completion:*:complete:*:_dirs:*' matcher-list ''

prompt_context() {
  prompt_segment black default "🛍️"

  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)%n@%m"
  fi
}
