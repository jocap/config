# vi: ft=sh

alias __A=`echo "\020"` # up arrow = ^p = back a command
alias __B=`echo "\016"` # down arrow = ^n = down a command
alias __C=`echo "\006"` # right arrow = ^f = forward a character
alias __D=`echo "\002"` # left arrow = ^b = back a character
alias __H=`echo "\001"` # home = ^a = start of line
alias __Y=`echo "\005"` # end = ^e = end of line

# ksh configuration

HISTFILE="$HOME/.ksh_history"
HISTSIZE=5000

PS1='${PWD} $ '
export EDITOR=vise
export FCEDIT=$EDITOR
export PAGER=less
export BROWSER=seamonkey

export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
export FZF_DEFAULT_OPTS='--color=light,fg:00'

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games
PATH=$HOME/bin:$PATH
PATH=$HOME/.fzf/bin:$PATH
export PATH

alias ls='colorls -G'
bind -m '^L'='clear^J'
bind -m '^[l'='ls^J'
bind -m '^T'='^Afzf -m | xargs ^J' # simple fzf command

set -o emacs
set -A complete_git -- status commit push log
