export FZF_DEFAULT_COMMAND='ag --nocolor -g "" 2>/dev/null'
export FZF_DIR_COMMAND='find $PWD -type d 2>/dev/null'
export FZF_IGNORE='-E "/\.cache\/|/\.git|/\.npm|/\.cpan"'

bind -m ^T='^[b^[f ^[ echo $(eval "$FZF_DEFAULT_COMMAND" | grep -v $FZF_IGNORE | fzf-tmux -m --reverse --height 40%)^[^E'
bind -m ^[c='^Ucd ^[ echo $(eval "$FZF_DIR_COMMAND" | grep -v $FZF_IGNORE | fzf-tmux --reverse --height 40%)^[^E^J'
bind -m ^[^T='^[b^[f ^[ echo $(eval "$FZF_DEFAULT_COMMAND" | grep -v $FZF_IGNORE | fzf-tmux -m --reverse --height 40% | xargs -L1 readlink -f 2>/dev/null)^[^E'
bind -m ^[^R=" ^Aecho \$(fc -nl 0 | trim | fzf-tmux +s --tac --height 40% -q '^E')^[^E^J"
# ^ warning: beware of single quotes and mksh magic!
