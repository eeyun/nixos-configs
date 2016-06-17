with import <nixpkgs> {};

writeText "zshrc" ''
  export ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh

  ZSH_THEME="bira"

  plugins=(git)

  source $ZSH/oh-my-zsh.sh

  export EDITOR=vim

  bindkey -v
  bindkey '^R' history-incremental-search-backward

  alias gitc="git checkout"
  alias gits="git status"
''
