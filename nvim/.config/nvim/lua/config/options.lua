vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.clipboard = "unnamedplus"
vim.o.number = true
vim.o.relativenumber = true
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 200,
		})
	end,
})
vim.api.nvim_set_hl(0, "Comment", { italic = false })
