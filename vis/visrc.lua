require("vis")
require("plugins/vis-modelines")
require("plugins/vis-filetype-settings")

settings = {
	markdown = {"set tw 4", "set et on"},
	python = {"set tw 4", "set et on"},
	ruby = {"set tw 2", "set et on"},
}

vis.events.subscribe(vis.events.INIT, function()
	vis:command("set theme acme-dark")
	vis:command("set autoindent on")
	vis:command("set shell /bin/sh")
	vis:command("map! normal W :w<Enter>")
	vis:command("map! normal E :w<Enter>:!gmake<Enter>")

	vis:command("map! normal ¤ $")
	vis:command("map! operator-pending ¤ $")
	vis:command("map! visual ¤ $")
	vis:command("map! normal Ö {")
	vis:command("map! operator-pending Ö {")
	vis:command("map! visual Ö {")
	vis:command("map! normal Ä }")
	vis:command("map! operator-pending Ä }")
	vis:command("map! visual Ä }")

	vis:command("set expandtab off")
	vis:command("set tabwidth 4")
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	vis:command("set savemethod inplace")
end)

vis.ftdetect.filetypes.bash.mime = {
	"text/x-shellscript", "application/x-shellscript"
}
vis.ftdetect.filetypes.mom = {
	ext = { "%.mom$" },
}
