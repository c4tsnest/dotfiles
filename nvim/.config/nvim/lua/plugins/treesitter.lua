return {
	-- 1. The Parser Downloader (The new role of nvim-treesitter)
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false, -- Must load on startup to install parsers
		build = ":TSUpdate",
		config = function()
			-- Install your required language parsers
			require("nvim-treesitter").install({
				"lua", "python", "javascript", "typescript", "c", "cpp", "html", "css"
			})

			-- Enable Native Highlighting globally
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "*",
				callback = function(args)
					-- pcall prevents crashes if a parser isn't installed yet
					pcall(vim.treesitter.start, args.buf)
				end,
			})

			-- Translate your old `custom_captures` to native highlight links
			vim.api.nvim_set_hl(0, "@comment", { link = "Comment", default = true })

			-- Enable Native Folding
			vim.opt.foldmethod = "expr"
			vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
			vim.opt.foldenable = false -- Don't fold everything automatically on open
		end,
	},

	-- 2. The Textobjects Replacement (mini.ai)
	{
		"echasnovski/mini.ai",
		event = "VeryLazy",
		opts = function()
			local ai = require("mini.ai")
			return {
				n_lines = 500,
				custom_textobjects = {
					-- These map to your old af/if (functions) and ac/ic (classes)
					f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
					c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),
					a = ai.gen_spec.treesitter({ a = "@parameter.outer", i = "@parameter.inner" }),
				},
				-- It also handles next/prev jumping natively!
				mappings = {
					goto_left = "[",
					goto_right = "]",
				},
			}
		end,
	}
}
