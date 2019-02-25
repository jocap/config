#!/usr/bin/env bash

# (for some reason, /bin/sh doesn't work)

cat /home/john/dev/config/wm/sxhkdrc | awk '/^[a-z]/ && last {print $0,"\t",last} {last=""} /^#/{last=$0}' | column -t -s $'\t' | fzf