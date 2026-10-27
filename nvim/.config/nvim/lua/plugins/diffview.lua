return {
	'sindrets/diffview.nvim',
	opts = {
		hooks = {
			diff_buf_win_enter = function()
				vim.wo.foldenable = false
			end,
		},
	},
}
