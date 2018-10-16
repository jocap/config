#!/bin/mksh

function die {
        print -ru2 -- "error: $*"
        exit 1
}

function psub {
        local stdin=$(cat; echo .) pipe

        pipe=$(mktemp /tmp/psub.XXXXXXXXXX) || die mktemp

        # this is racy
        rm -f "$pipe"
        mkfifo "$pipe" || die mkfifo

        (
                # don't block parent
                exec <&- >&- 2>&-
                # write content to FIFO
                print -nr -- "${stdin%.}" >"$pipe"
                # signal EOF to reader, ensure it's not merged
                sleep 0.1
                :>"$pipe"
                # clean up
                (sleep 1; rm -f "$pipe") &
        ) &
        print -nr -- "$pipe"
}
