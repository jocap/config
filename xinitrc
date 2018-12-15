#!/bin/sh

xset fp+ /usr/local/share/fonts/mscorefonts
xset fp+ /usr/local/share/fonts/ghostscript
xset fp+ /usr/local/share/fonts/terminus

export LC_CTYPE=en_US.UTF-8

xset m 1/1 1
xinput set-prop 7 239 0.9
setxkbmap usx

# for trash can to work
if [ -x /usr/local/bin/dbus-launch -a -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
	eval $(dbus-launch --sh-syntax --exit-with-x11)
fi

wmaker
