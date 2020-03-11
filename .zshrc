# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="nanotech"

# Plugins

plugins=(
  adb
  aws
  django
  docker
  docker-compose
  git
  git-extras
  httpie
  jira
  pass
  pep8
  pip
  python
  ssh-agent
  sublime
  taskwarrior
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# FZF

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Aliases

source $HOME/.zsh/aliases.zsh
source $HOME/.zsh/aliases-work.zsh
source $HOME/.zsh/aliases-starwarrior.zsh

# Exports

source $HOME/.zsh/exports.zsh
source $HOME/.zsh/exports-work.zsh
