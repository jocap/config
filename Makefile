symlinks:
	ln -sf $(PWD)/x11/urxvt ~/.urxvt
	ln -sf $(PWD)/x11/xinitrc ~/.xinitrc
	ln -sf $(PWD)/x11/Xresources ~/.Xresources
	ln -sf $(PWD)/wm/panel/panel* ~/bin/
	ln -sf $(PWD)/wm/panel/set* ~/bin/
	ln -sf $(PWD)/fontconfig/fonts.conf ~/.config/fontconfig/fonts.conf
	ln -sf $(PWD)/vis ~/.config/vis
	ln -sf $(PWD)/shell/kshrc ~/.kshrc
	ln -sf $(PWD)/shell/profile ~/.profile

rootsymlinks:
	ln -sf $(PWD)/x11/xorg.conf /etc/X11/xorg.conf
