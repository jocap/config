require("vis")
require("plugins/vis-modelines")
require("plugins/vis-filetype-settings")
	
settings = {
	markdown = {"set tw 4", "set et on"},
	ruby = {"set tw 2", "set et on"},
}

vis.events.subscribe(vis.events.INIT, function()
	vis:command("set theme acme")
	vis:command("set autoindent on")
	vis:command("set shell /bin/sh")
	vis:command("map! normal W :w<Enter>")

	vis:command("set expandtab off")
	vis:command("set tabwidth 4")
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	vis:command("set savemethod inplace")
end)

vis.ftdetect.filetypes.bash.mime = {
	"text/x-shellscript", "application/x-shellscript"
}
