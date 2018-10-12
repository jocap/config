require('vis')
require('plugins/vis-modelines')

vis.events.subscribe(vis.events.INIT, function()
	vis:command('set theme acme')
	vis:command('set autoindent on')
	vis:command('set shell /bin/sh')
	vis:command('map! normal W :w<Enter>')

	vis:command('set expandtab off')
	vis:command('set tabwidth 4')
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	vis:command('set savemethod inplace')
	vis:command('set relative')
end)

vis.ftdetect.filetypes.bash.mime = {
	"text/x-shellscript", "application/x-shellscript"
}
