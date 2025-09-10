return {
	{
		"p00f/nvim-ts-rainbow",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = function()
			require 'nvim-treesitter.configs'.setup {
				rainbow = {
					enable = true,
					extended_mode = true,
					max_file_lines = nil,
				}
			}
		end,
	},
}
