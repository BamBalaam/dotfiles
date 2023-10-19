alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
alias preview="fzf --preview 'bat --color always {}'"
alias preview_to_subl='subl $(preview)'
alias sp=' ~/.i3/scripts/spotify.sh'
alias obsidian='flatpak run md.obsidian.Obsidian'

alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"

function mygitstats () {
    for project in */; do
        cd $project;
        if [ -d .git ]; then
            echo Stats for André/e in $project;
            git log --shortstat --author="André |Andre " |\
            grep -E "fil(e|es) changed" |\
            awk '{files+=$1; inserted+=$4; deleted+=$6; delta+=$4-$6; ratio=deleted/inserted} END {printf "Commit stats:\n- Files changed (total)..  %s\n- Lines added (total)....  %s\n- Lines deleted (total)..  %s\n- Total lines (delta)....  %s\n- Add./Del. ratio (1:n)..  1 : %s\n", files, inserted, deleted, delta, ratio }' -;
            echo "\n";
        fi;
        cd ..;
    done
}
