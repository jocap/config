# vi: ts=8:sw=8

symlinks:
	ln -sf	$(PWD)/x11/urxvt			~/.urxvt
	ln -sf	$(PWD)/x11/xinitrc			~/.xinitrc
	ln -sf	$(PWD)/x11/Xresources			~/.Xresources
	ln -sf	$(PWD)/wm/tools/*			~/bin/
	ln -sf	$(PWD)/fontconfig/fonts.conf		~/.config/fontconfig/fonts.conf
	ln -sf	$(PWD)/vis				~/.config/vis
	ln -sf	$(PWD)/shell/kshrc			~/.kshrc
	ln -sf	$(PWD)/shell/profile			~/.profile
	ln -sf	$(PWD)/xdg/user-dirs.dirs		~/.config/user-dirs.dirs
	ln -sf	$(PWD)/firefox/user*.css		~/.mozilla/firefox/*.default/chrome/
	ln -sf	$(PWD)/mail/mbsyncrc			~/.mbsyncrc
	ln -sf	$(PWD)/mail/msmtprc			~/.msmtprc
	ln -sf	$(PWD)/mail/mime.types			~/.mime.types
	ln -sf	$(PWD)/mail/tools/*			~/bin/
	ln -sfh	$(PWD)/troff/tmac			~/.tmac
	ln -sfh	$(PWD)/mutt				~/.mutt
	ln -sfh	$(PWD)/dunst				~/.config/dunst
	ln -sf	$(PWD)/xdg/applications/*		~/.local/share/applications/
	ln -sf	$(PWD)/ssh/*				~/.ssh/

hardlinks:
	ln -f	$(PWD)/wm/windowmaker/defaults/*	~/GNUstep/Defaults/

rootsymlinks:
	ln -sf	$(PWD)/x11/xorg.conf			/etc/X11/xorg.conf
	ln -sf	$(PWD)/os/syslog.conf			/etc/syslog.conf
	ln -sf	$(PWD)/x11/xkb/*			/usr/X11R6/share/X11/xkb/symbols/
