return {
	{
		"nvim-pack/nvim-spectre",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("spectre").setup({
				color_devicons = true,
				open_cmd = "vsplit",
				is_open_target_win = true,
				highlight = { ui = "String" },
			})

			local map = vim.keymap.set
			local opts = { noremap = true, silent = true }
			map("n", "<leader>sp", "<cmd>lua require('spectre').open()<CR>", opts)
			map("n", "<leader>sb", "<cmd>lua require('spectre').open_file_search()<CR>", opts)
			map("n", "<leader>sw", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", opts)
		end,
	},
}
