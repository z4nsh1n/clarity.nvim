local p = require("clarity.palette")

return {
	normal = {
		a = { bg = p.fg, fg = p.bg, gui = 'bold' },
		b = { bg = p.bg, fg = p.fg },
		c = { bg = p.bg, fg = p.fg },
	},
	insert = {
		a = { bg = p.blue, fg = p.fg, gui = 'bold' },
		b = { bg = p.bg, fg = p.fg },
		c = { bg = p.bg, fg = p.fg },
	},
	visual = {
		a = { bg = p.purple, fg = p.fg, gui = 'bold' },
		b = { bg = p.bg, fg = p.fg },
		c = { bg = p.bg, fg = p.fg },
	},
	replace = {
		a = { bg = p.blue, fg = p.fg, gui = 'bold' },
		b = { bg = p.bg, fg = p.fg },
		c = { bg = p.bg, fg = p.fg },
	},
	command = {
		a = { bg = p.red, fg = p.fg, gui = 'bold' },
		b = { bg = p.bg, fg = p.fg },
		c = { bg = p.bg, fg = p.fg },
	},
	inactive = {
		a = { bg = p.fg, fg = p.bg, gui = 'bold' },
		b = { bg = p.bg, fg = p.fg },
		c = { bg = p.bg, fg = p.fg },
	},
}
