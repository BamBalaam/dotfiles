alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
alias jira_current='jira $(git rev-parse --abbrev-ref HEAD)'
alias preview="fzf --preview 'bat --color always {}'"
alias preview_to_subl='subl $(preview)'
alias sp=' ~/.i3/scripts/spotify.sh'
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
