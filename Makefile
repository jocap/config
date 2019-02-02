# vi: ts=8:sw=8

symlinks:
	ln -sfh	$(PWD)/x11/urxvt		~/.urxvt
	ln -sf	$(PWD)/x11/xinitrc		~/.xinitrc
	ln -sf	$(PWD)/x11/Xresources		~/.Xresources
	ln -sf	$(PWD)/wm/panel/panel*		~/bin/
	ln -sf	$(PWD)/wm/tools/*		~/bin/
	ln -sf	$(PWD)/fontconfig/fonts.conf	~/.config/fontconfig/fonts.conf
	ln -sfh	$(PWD)/vis			~/.config/vis
	ln -sf	$(PWD)/shell/kshrc		~/.kshrc
	ln -sf	$(PWD)/shell/profile		~/.profile
	ln -sf	$(PWD)/xdg/user-dirs.dirs	~/.config/user-dirs.dirs
	ln -sf	$(PWD)/firefox/userChrome.css	~/.mozilla/firefox/*.default/chrome/

rootsymlinks:
	ln -sf	$(PWD)/x11/xorg.conf		/etc/X11/xorg.conf
	ln -sf	$(PWD)/x11/xkb/*		/usr/X11R6/share/X11/xkb/symbols/
