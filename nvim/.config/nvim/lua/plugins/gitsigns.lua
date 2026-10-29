return {
	"lewis6991/gitsigns.nvim",
	opts = {
		signs = {
			add = { hl = "GitGutterAdd", text = "│", numhl = "GitGutterAddNr" },
			change = { hl = "GitGutterChange", text = "│", numhl = "GitGutterChangeNr" },
			delete = { hl = "GitGutterDelete", text = "_", numhl = "GitGutterDeleteNr" },
			topdelete = { hl = "GitGutterDelete", text = "‾", numhl = "GitGutterDeleteNr" },
			changedelete = { hl = "GitGutterChange", text = "~", numhl = "GitGutterChangeNr" },
		},
		numhl = true, -- 行番号に色を付ける
		linehl = false, -- 行全体をハイライトする
		watch_gitdir = { interval = 1000 },
		sign_priority = 6,
		update_debounce = 100,
		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")
			local function map(lhs, rhs, desc)
				vim.keymap.set("n", lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
			end

			map("<leader>hs", gitsigns.stage_hunk, "Stage hunk")
			map("<leader>hr", gitsigns.reset_hunk, "Reset hunk")
			map("]c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "]c", bang = true })
				else
					gitsigns.nav_hunk("next")
				end
			end, "Next hunk")
			map("[c", function()
				if vim.wo.diff then
					vim.cmd.normal({ "[c", bang = true })
				else
					gitsigns.nav_hunk("prev")
				end
			end, "Previous hunk")
		end,
	},
}
