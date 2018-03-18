# What's the setup? Symlinks? Special tools? No.

```
git init --bare $HOME/.myconf
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
```

https://news.ycombinator.com/item?id=11071754
