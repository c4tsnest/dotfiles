vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.clipboard = "unnamedplus"
vim.o.number = true
vim.o.relativenumber = true
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
vim.o.autoread = true

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 200,
		})
	end,
})
vim.api.nvim_set_hl(0, "Comment", { italic = false })

if vim.fn.has("wsl") == 1 then
	if vim.fn.executable("wl-copy") == 0 then
		print("wl-clipboard not found, clipboard integration won't work")
	else
		vim.g.clipboard = {
			name = "wl-clipboard (wsl)",
			copy = {
				["+"] = 'wl-copy --foreground --type text/plain',
				["*"] = 'wl-copy --foreground --primary --type text/plain',
			},
			paste = {
				["+"] = (function()
					return vim.fn.systemlist('wl-paste --no-newline|sed -e "s/\r$//"', { '' }, 1) -- '1' keeps empty lines
				end),
				["*"] = (function()
					return vim.fn.systemlist('wl-paste --primary --no-newline|sed -e "s/\r$//"',
						{ '' },
						1)
				end),
			},
			cache_enabled = true
		}
	end
end

vim.lsp.config("slang-server", {
	cmd = { "slang-server" },
	root_markers = { ".git", ".slang" },
	filetypes = {
		"systemverilog",
		"verilog",
	},
})

vim.lsp.enable("slang-server")
