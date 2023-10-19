# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins

plugins=(
  adb
  aws
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
  zsh-autosuggestions
  zsh-interactive-cd
)

zstyle :omz:plugins:ssh-agent identities gerrit

source $ZSH/oh-my-zsh.sh

# FZF

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source $HOME/.fzf/plugin/fzf-git.sh

# Aliases

source $HOME/.zsh/aliases.zsh
source $HOME/.zsh/aliases-work.zsh

# Exports

source $HOME/.zsh/exports.zsh
source $HOME/.zsh/exports-work.zsh

# Keys
bindkey "^[Od" backward-word
bindkey "^[Oc" forward-word
bindkey  "^[^[Od"   beginning-of-line
bindkey  "^[^[Oc"   end-of-line
bindkey "^[[5~" backward-kill-word
bindkey "^[[6~" kill-word

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
